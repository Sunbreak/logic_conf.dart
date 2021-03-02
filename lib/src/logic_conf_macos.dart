import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'logic_conf_interface.dart';
import 'macos/constants.dart';
import 'macos/corefoundation.dart';
import 'macos/iokit.dart';

class LogicConfMacos extends LogicConfPlatform {
  final _cf = CoreFoundation(DynamicLibrary.open('/System/Library/Frameworks/CoreFoundation.framework/Resources/BridgeSupport/CoreFoundation.dylib'));

  final _io = IOKit(DynamicLibrary.open('/System/Library/Frameworks/IOKit.framework/Resources/BridgeSupport/IOKit.dylib'));

  Pointer<io_service_t> _entryPtr = nullptr;

  Pointer<IOHIDDevice> _devicePtr = nullptr;

  @override
  List listDevices() {
    // TODO: implement listDevices
    throw UnimplementedError();
  }
  
  @override
  bool openDevice(String path) {
    _entryPtr = _io.IORegistryEntryFromPath(kIOMasterPortDefault, path.toNativeUtf8().cast());
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