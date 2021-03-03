import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'linux/hidraw.dart';
import 'linux/libudev.dart';
import 'logic_conf_interface.dart';
import 'linux/libc.dart';
import 'util/pool.dart';

class LogicConfLinux extends LogicConfPlatform {
  int _devDescriptor = -1;

  final _libc = LibC(DynamicLibrary.open('libc.so.6'));

  final _libudev = Libudev(DynamicLibrary.open('libudev.so.1'));

  @override
  List<dynamic> listDevices() {
    var udevContext = _libudev.udev_new();
    if (udevContext == nullptr) {
      // TODO strerror()
      print('Create udev context error');
      return [];
    }

    var enumerateContext = _libudev.udev_enumerate_new(udevContext);
    try {
      using((Pool pool) {
        var nativeUtf8 = 'hidraw'.toNativeUtf8(allocator: pool);
        return _libudev.udev_enumerate_add_match_subsystem(enumerateContext, nativeUtf8.cast());
      });
      _libudev.udev_enumerate_scan_devices(enumerateContext);

      var deviceList = _libudev.udev_enumerate_get_list_entry(enumerateContext);

      return _interateDevice(udevContext, deviceList).toList();
    } finally {
      _libudev.udev_enumerate_unref(enumerateContext);
      _libudev.udev_unref(udevContext);
    }
  }

  Iterable<Map<String, dynamic>> _interateDevice(Pointer<udev> udevContext, Pointer<udev_list_entry> deviceList) sync* {
    for (var entry = deviceList; entry != nullptr; entry = _libudev.udev_list_entry_get_next(deviceList)) {
      var sysfsPath = _libudev.udev_list_entry_get_name(entry);
      var rawDevice = _libudev.udev_device_new_from_syspath(udevContext, sysfsPath);
      var sysAttributes = _getSysAttributes(rawDevice);
      _libudev.udev_device_unref(rawDevice);
      if (sysAttributes == null) {
        continue;
      }
    
      var reportDescriptorValue = _readReportDescriptor(sysfsPath.cast<Utf8>().toDartString());
      if (reportDescriptorValue == null) {
        continue;
      }
      try {
        var usagePairs = _parseUsagePairs(reportDescriptorValue);
        for (var pair in usagePairs) {
          yield {
            ...sysAttributes,
            'usagePage': pair[0],
            'usage': pair[1],
          };
        }
      } on ArgumentError catch (e) {
        print(e.stackTrace);
      }
    }
  }

  Map<String, dynamic>? _getSysAttributes(Pointer<udev_device> rawDevice) {
    // Do not unref parent
    var parentDevice = using((Pool pool) {
      var nativeUtf8 = 'hid'.toNativeUtf8(allocator: pool);
      return _libudev.udev_device_get_parent_with_subsystem_devtype(rawDevice, nativeUtf8.cast(), nullptr);
    });
    if (parentDevice == nullptr) {
      return null;
    }

    var path = _libudev.udev_device_get_devnode(parentDevice);
    
    var sysAttributeValuesPtr = using((Pool pool) {
      var nativeUtf8 = 'uevent'.toNativeUtf8(allocator: pool);
      return _libudev.udev_device_get_sysattr_value(parentDevice, nativeUtf8.cast());
    });
    var sysAttributeValues = sysAttributeValuesPtr.cast<Utf8>().toDartString();
    for (var attributeValue in sysAttributeValues.split('\n')) {
      if (!attributeValue.contains('=')) continue;

      var indexOf = attributeValue.indexOf('=');
      var key = attributeValue.substring(0, indexOf);
      var value = attributeValue.substring(indexOf);

      if (key == 'HID_ID') { // HID_ID=0003:000005AC:00008242
        var split = value.split(':');
        return {
          'path': path,
          'vendorId': split[1],
          'productId': split[2],
        };
      }
    }

    return null;
  }

  Uint8List? _readReportDescriptor(String sysfsPath) {
    var reportDescriptor = using((Pool pool) {
      var nativeUtf8 = '$sysfsPath/device/report_descriptor'.toNativeUtf8(allocator: pool);
      return _libc.open2(nativeUtf8.cast(), O_RDONLY);
    });
    if (reportDescriptor < 0) {
      // TODO strerror()
      print('open error');
      return null;
    }
    
    var buffer = calloc<Uint8>(HID_MAX_DESCRIPTOR_SIZE);
    try {
      var readLength = _libc.read(reportDescriptor, buffer.cast(), HID_MAX_DESCRIPTOR_SIZE);
      if (readLength < 0) {
        // TODO strerror()
        print('read error');
        return null;
      }
      return Uint8List.fromList(buffer.asTypedList(readLength));
    } finally {
      _libc.close(reportDescriptor);
      calloc.free(buffer);
    }
  }

  /// [usagePage, usage]
  Iterable<List<int>> _parseUsagePairs(Uint8List reportDescriptorValue) sync* {
    var onlyTopCollection = true;
    var pos = 0;

    int? usagePage;
    int? usage;
    while (pos < reportDescriptorValue.length) {      
      var klvSize = _parseKLVSize(reportDescriptorValue, pos);
      var dataLength = klvSize[0];
      var keySize = klvSize[1];

      var keyCmd = reportDescriptorValue[pos] & 0xFC;
      switch (keyCmd) {
        case 0x04: /* Usage Page 6.2.2.7 (Global) */
          usagePage = _parseKLVData(reportDescriptorValue, pos, dataLength);
          break;
        case 0x08: /* Usage 6.2.2.8 (Local) */
          usage = _parseKLVData(reportDescriptorValue, pos, dataLength);
          break;
        case 0xA0: /* Collection 6.2.2.4 (Main) */
          onlyTopCollection = false;
          // Usage Item (Local) must be found for the pair to be valid
          if (usagePage != null && usage != null) {
            yield [usagePage, usage];
          }
          break;
        case 0x80: /* Input 6.2.2.4 (Main) */
        case 0x90: /* Output 6.2.2.4 (Main) */
        case 0xB0: /* Feature 6.2.2.4 (Main) */
        case 0xC0: /* End Collection 6.2.2.4 (Main) */
          /* Usage is a Local Item, unset it */
          usage = null;
			    break;
      }

      pos += dataLength + keySize;
    }
    
    if (onlyTopCollection && usagePage != null && usage != null) {
      yield [usagePage, usage];
    }
  }

  // [dataLength, keySize]
  List<int> _parseKLVSize(Uint8List origin, int pos) {
    var key = origin[pos];

    // https://usb.org/sites/default/files/hid1_11.pdf
    // Section 6.2.2.3, Long Items
    if (key & 0xF0 == 0xF0) {
      if (pos + 1 < origin.length) {
        return [origin[pos + 1], 3];
      }
    }

    // https://usb.org/sites/default/files/hid1_11.pdf
    // Section 6.2.2.2, Short Items
    var sizeCode = key & 0x03;
    switch (sizeCode) {
      case 0:
      case 1:
      case 2:      
        return [sizeCode, 1];
      case 3:
        return [4, 1];
    }

    throw ArgumentError('Invalid item');
  }

  int? _parseKLVData(Uint8List reportDescriptorValue, int pos, int dataLength) {
    if (pos + dataLength < reportDescriptorValue.length) {
      var byteData = reportDescriptorValue.buffer.asByteData(pos + 1);
      switch (dataLength) {
        case 0:
          return 0;
        case 1:
          return byteData.getInt8(0);
        case 2:
          return byteData.getInt16(0, Endian.little);
        case 4:
          return byteData.getInt32(0, Endian.little);
      }
    }
    return null;
  }

  @override
  bool openDevice(String path) {
    var descriptor = using((Pool pool) {
      var nativeUtf8 = path.toNativeUtf8(allocator: pool);
      return _libc.open2(nativeUtf8.cast(), O_RDWR);
    });

    if (descriptor < 0) {
      // TODO strerror()
      print('open2 error');
      return false;
    };
    _devDescriptor = descriptor;
    return true;
  }

  @override
  void closeDevice() {
    if (_devDescriptor >= 0) {
      _libc.close(_devDescriptor);
    }
  }

  @override
  int sendData(Uint8List data) {
    var dataPtr = calloc<Uint8>(data.length);
    dataPtr.asTypedList(data.length).setAll(0, data);
    try {
      return _libc.write(_devDescriptor, dataPtr.cast(), data.length);
    } finally {
      calloc.free(dataPtr);
    }
  }
}
