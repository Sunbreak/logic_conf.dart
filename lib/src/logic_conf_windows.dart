import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import 'logic_conf_interface.dart';
import 'windows/hidsdi.dart' as hid;

class LogicConfWindows extends LogicConfPlatform {
  var _devHandle = INVALID_HANDLE_VALUE;

  final _hidSdi = hid.HidSdi(DynamicLibrary.open('hid.dll'));

  @override
  List<dynamic> listDevices() {
    var devicePathList = using((Arena arena) {
      final interfaceGuid = arena<GUID>()..ref.setGUID(GUID_DEVINTERFACE_HID);

      final hDevInfo = SetupDiGetClassDevs(
          interfaceGuid, nullptr, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
      try {
        return _deviceByInterface(hDevInfo, interfaceGuid).toList();
      } finally {
        SetupDiDestroyDeviceInfoList(hDevInfo);
      }
    });

    return devicePathList.map((path) {
      var pathPtr = calloc<Uint16>(path.length);
      pathPtr.asTypedList(path.length).setRange(0, path.length, path);
      var devHandle = CreateFile(pathPtr.cast(), 0,
          FILE_SHARE_READ | FILE_SHARE_WRITE, nullptr, OPEN_EXISTING, 0, NULL);
      try {
        return {
          'path': utf8.decode(path),
          ..._getAttributes(devHandle),
          ..._getPreparsedData(devHandle),
        };
      } finally {
        calloc.free(pathPtr);
        CloseHandle(devHandle);
      }
    }).toList();
  }

  Iterable<Uint16List> _deviceByInterface(
      int hDevInfo, Pointer<GUID> interfaceGuid) sync* {
    final requiredSizePtr = calloc<Uint32>();
    final devicInterfaceDataPtr = calloc<SP_DEVICE_INTERFACE_DATA>()
      ..ref.cbSize = sizeOf<SP_DEVICE_INTERFACE_DATA>();
    try {
      for (var index = 0;
          SetupDiEnumDeviceInterfaces(hDevInfo, nullptr,
                  interfaceGuid.cast(), index, devicInterfaceDataPtr) ==
              TRUE;
          index++) {
        final hr = SetupDiGetDeviceInterfaceDetail(hDevInfo,
            devicInterfaceDataPtr, nullptr, 0, requiredSizePtr, nullptr);
        // FIXME https://github.com/timsneath/win32/issues/384
        // if (hr != TRUE) {
        //   final error = GetLastError();
        //   if (error != ERROR_INSUFFICIENT_BUFFER) {
        //     print('SetupDiGetDeviceInterfaceDetail - Get Data Size error: $error');
        //     throw WindowsException(error);
        //   }
        // }

        final detailDataMemoryPtr = calloc<Uint16>(requiredSizePtr.value);

        try {
          final deviceInterfaceDetailDataPtr =
              Pointer<SP_DEVICE_INTERFACE_DETAIL_DATA_>.fromAddress(
                  detailDataMemoryPtr.address);
          deviceInterfaceDetailDataPtr.ref.cbSize =
              sizeOf<SP_DEVICE_INTERFACE_DETAIL_DATA_>();

          final hr = SetupDiGetDeviceInterfaceDetail(
              hDevInfo,
              devicInterfaceDataPtr,
              deviceInterfaceDetailDataPtr,
              requiredSizePtr.value,
              nullptr,
              nullptr);
          if (hr != TRUE) {
            print(
                'SetupDiGetDeviceInterfaceDetail - Get Data error ${GetLastError()}');
            continue;
          }

          // rawPathData would be freed with detailDataMemoryPtr
          final rawPathData = deviceInterfaceDetailDataPtr
              .getDevicePathData(requiredSizePtr.value);
          yield Uint16List.fromList(rawPathData);
        } finally {
          calloc.free(detailDataMemoryPtr);
        }
      }

      final error = GetLastError();
      if (error != S_OK && error != ERROR_NO_MORE_ITEMS) {
        throw WindowsException(error);
      }
    } finally {
      calloc
        ..free(requiredSizePtr)
        ..free(devicInterfaceDataPtr);
    }
  }

  Map<String, dynamic> _getAttributes(int devHandle) {
    var res = <String, dynamic>{};

    var attributesPtr = calloc<hid.HIDD_ATTRIBUTES>();
    if (_hidSdi.HidD_GetAttributes(devHandle, attributesPtr) == TRUE) {
      res = {
        'vendorId': attributesPtr.ref.VendorID,
        'productId': attributesPtr.ref.ProductID,
      };
    } else {
      print('HidD_GetAttributes error ${GetLastError()}');
    }
    calloc.free(attributesPtr);

    return res;
  }

  Map<String, dynamic> _getPreparsedData(int devHandle) {
    var res = <String, dynamic>{};

    var preparsedDataRefPtr = calloc<hid.PHIDP_PREPARSED_DATA>();
    if (_hidSdi.HidD_GetPreparsedData(devHandle, preparsedDataRefPtr) == TRUE) {
      var capsPtr = calloc<hid.HIDP_CAPS>();
      var getCaps = _hidSdi.HidP_GetCaps(preparsedDataRefPtr.value, capsPtr);
      if (getCaps == hid.HIDP_STATUS_SUCCESS) {
        res = {
          'usagePage': capsPtr.ref.UsagePage,
          'usage': capsPtr.ref.Usage,
        };
      } else {
        print('HidP_GetCaps error $getCaps');
      }
      calloc.free(capsPtr);
      _hidSdi.HidD_FreePreparsedData(preparsedDataRefPtr.value);
    }
    calloc.free(preparsedDataRefPtr);

    return res;
  }

  @override
  bool openDevice(String path) {
    _devHandle = using((Arena arena) {
      var nativeUtf16 = path.toNativeUtf16(allocator: arena);
      return CreateFile(
        nativeUtf16,
        GENERIC_READ | GENERIC_WRITE,
        FILE_SHARE_READ | FILE_SHARE_WRITE,
        nullptr,
        OPEN_EXISTING,
        0,
        NULL,
      );
    });

    return _devHandle != INVALID_HANDLE_VALUE;
  }

  @override
  void closeDevice() {
    if (_devHandle != INVALID_HANDLE_VALUE) {
      CloseHandle(_devHandle);
    }
  }

  @override
  int sendData(Uint8List data) {
    var dataPtr = calloc<Uint8>(data.length);
    dataPtr.asTypedList(data.length).setAll(0, data);
    var writtenLengthPtr = calloc<Uint32>();
    try {
      var writeFile = WriteFile(_devHandle, dataPtr, data.length, writtenLengthPtr, nullptr);
      if (writeFile != TRUE) {
        return -1;
      }
      return writtenLengthPtr.value;
    } finally {
      calloc.free(dataPtr);
      calloc.free(writtenLengthPtr);
    }
  }
}

extension Pointer_SP_DEVICE_INTERFACE_DETAIL_DATA_
    on Pointer<SP_DEVICE_INTERFACE_DETAIL_DATA_> {
  /// FIXME [SP_DEVICE_INTERFACE_DETAIL_DATA_.DevicePath]
  Uint16List getDevicePathData(int requiredSize) =>
      Pointer<Uint16>.fromAddress(address).asTypedList(requiredSize).sublist(2);
}