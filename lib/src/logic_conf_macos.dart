import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'logic_conf_interface.dart';
import 'macos/constants.dart';
import 'macos/corefoundation.dart';
import 'macos/iokit.dart' hide CFSetRef, CFStringRef, CFDictionaryRef;

class LogicConfMacos extends LogicConfPlatform {
  final _cf = CoreFoundation(DynamicLibrary.open('/System/Library/Frameworks/CoreFoundation.framework/Resources/BridgeSupport/CoreFoundation.dylib'));

  final _io = IOKit(DynamicLibrary.open('/System/Library/Frameworks/IOKit.framework/Resources/BridgeSupport/IOKit.dylib'));

  Pointer<io_service_t> _entryPtr = nullptr;

  Pointer<IOHIDDeviceRef> _devicePtr = nullptr;

  @override
  List listDevices() {
    var managerPtr = _io.IOHIDManagerCreate(kCFAllocatorDefault, kIOHIDOptionsTypeNone);
    _io.IOHIDManagerSetDeviceMatching(managerPtr, nullptr);
    var deviceSetPtr = _io.IOHIDManagerCopyDevices(managerPtr);
    try {
      if (deviceSetPtr == nullptr) return [];

      return _iterateDevice(deviceSetPtr.cast()).toList();
    } finally {
      _io.IOHIDManagerClose(managerPtr, kIOHIDOptionsTypeNone);
      _cf.CFRelease(deviceSetPtr.cast());
    }
  }

  Iterable<dynamic> _iterateDevice(Pointer<CFSetRef> deviceSetPtr) sync* {
    var count = _cf.CFSetGetCount(deviceSetPtr.cast());
    var deviceListRefPtr = calloc<Pointer<IOHIDDeviceRef>>(count);
    _cf.CFSetGetValues(deviceSetPtr, deviceListRefPtr.cast());

    for (var i = 0; i < count; i++) {
      var devicePtr = deviceListRefPtr.elementAt(i).value;
      var path = using((Arena arena) {
        var servicePtr = _io.IOHIDDeviceGetService(devicePtr);
        var pathPtr = arena<Int8>(io_string_t_length);
        var res = _io.IORegistryEntryGetPath(servicePtr, kIOServicePlane.toNativeUtf8(allocator: arena).cast(), pathPtr);
        return res == KERN_SUCCESS ? pathPtr.cast<Utf8>().toDartString() : '';
      });
      var vendorId = _getInt32Property(devicePtr, kIOHIDVendorIDKey);
      var productId = _getInt32Property(devicePtr, kIOHIDProductIDKey);

      var usegePairsPtr = _getArrayProperty(devicePtr, kIOHIDDeviceUsagePairsKey);
      var usegePairCount = _cf.CFArrayGetCount(usegePairsPtr);
      for (var j = 0; j < usegePairCount; j++) {
        var item = _cf.CFArrayGetValueAtIndex(usegePairsPtr, j);
        if (_cf.CFGetTypeID(item) != _cf.CFDictionaryGetTypeID()) {
          continue;
        }
        var usagePairDictPtr = item.cast<CFDictionaryRef>();
        var usagePage = _getInt32Value(usagePairDictPtr, kIOHIDDeviceUsagePageKey);
        var usage = _getInt32Value(usagePairDictPtr, kIOHIDDeviceUsageKey);
        yield {
          'path': path,
          'vendorId': vendorId,
          'productId': productId,
          'usagePage': usagePage,
          'usage': usage,
        };
      }
    }

    calloc.free(deviceListRefPtr);
  }

  T _usingCFString<T>(String string, T Function(Pointer<CFStringRef>) computation) {
    return using((Arena arena) {
      var keyPtr = string.toNativeUtf8(allocator: arena);
      var keyCFPtr = _cf.CFStringCreateWithCString(kCFAllocatorDefault, keyPtr.cast(), kCFStringEncodingUTF8);
      var result = computation(keyCFPtr);
      _cf.CFRelease(keyCFPtr.cast());
      return result;
    });
  }

  int? _getInt32Property(Pointer<IOHIDDeviceRef> devicePtr, String key) {
    var property = _usingCFString(key, (keyCFPtr) => _io.IOHIDDeviceGetProperty(devicePtr, keyCFPtr.cast()));
    if (property == nullptr || _cf.CFGetTypeID(property) != _cf.CFNumberGetTypeID()) {
      return null;
    }

    var valuePtr = calloc<Int32>();
    try {
      _cf.CFNumberGetValue(property.cast(), kCFNumberSInt32Type, valuePtr.cast());
      return valuePtr.value;
    } finally {
      calloc.free(valuePtr);      
    }
  }

  Pointer<CFArrayRef> _getArrayProperty(Pointer<IOHIDDeviceRef> devicePtr, String key) {
    var property = _usingCFString(key, (keyCFPtr) => _io.IOHIDDeviceGetProperty(devicePtr, keyCFPtr.cast()));
    if (property == nullptr || _cf.CFGetTypeID(property) != _cf.CFArrayGetTypeID()) {
      return nullptr;
    }
    return property.cast();
  }

  int? _getInt32Value(Pointer<CFDictionaryRef> usagePairDictPtr, String key) {
    return _usingCFString(key, (keyCFPtr) {
      var usagePageRefPtr = calloc<Pointer<Void>>();
      var valuePtr = calloc<Int32>();
      try {
        var getValue = _cf.CFDictionaryGetValueIfPresent(usagePairDictPtr, keyCFPtr.cast(), usagePageRefPtr);
        if (getValue != True || _cf.CFGetTypeID(usagePageRefPtr.value) != _cf.CFNumberGetTypeID()) {
          return null;
        }
        _cf.CFNumberGetValue(usagePageRefPtr.value.cast(), kCFNumberSInt32Type, valuePtr.cast());
        return valuePtr.value;
      } finally {
        calloc.free(usagePageRefPtr);
        calloc.free(valuePtr);
      }
    });
  }
  
  @override
  bool openDevice(String path) {
    _entryPtr = using((Arena arena) {
      var nativeUtf8 = path.toNativeUtf8(allocator: arena);
      return _io.IORegistryEntryFromPath(kIOMasterPortDefault, nativeUtf8.cast());
    });

    if (_entryPtr == nullptr) {
        print('IORegistryEntryFromPath error');
        return false;
    }

    _devicePtr = _io.IOHIDDeviceCreate(kCFAllocatorDefault, _entryPtr);
    if (_devicePtr == nullptr) {
      print('IOHIDDeviceCreate error');
      return false;
    }

    var hidDeviceOpen = _io.IOHIDDeviceOpen(_devicePtr, kIOHIDOptionsTypeNone);
    if (hidDeviceOpen != kIOReturnSuccess) {
      print('IOHIDDeviceOpen error $hidDeviceOpen');
      return false;
    }
    return true;
  }

  @override
  void closeDevice() {
    if (_devicePtr != nullptr) {
      _io.IOHIDDeviceClose(_devicePtr, kIOHIDOptionsTypeNone);
      _cf.CFRelease(_devicePtr.cast());
    }
    if (_entryPtr != nullptr) {
      _io.IOObjectRelease(_entryPtr);
    }
  }
  
  @override
  int sendData(Uint8List data) {
    var dataPtr = calloc<Uint8>(data.length);
    dataPtr.asTypedList(data.length).setAll(0, data);
    try {
      var setReport = _io.IOHIDDeviceSetReport(_devicePtr, kIOHIDReportTypeOutput, 0, dataPtr, data.length);
      if (setReport != kIOReturnSuccess) {
        print('IOHIDDeviceSetReport error $setReport');
        return -1;
      }
      return data.length;
    } finally {
      calloc.free(dataPtr);
    }
  }
}