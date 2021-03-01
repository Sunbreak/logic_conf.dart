import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import 'logic_conf_interface.dart';
import 'windows/hidsdi.dart' as hid;
import 'windows/setupapi.dart' as sp;

class LogicConfWindows extends LogicConfPlatform {
  var _devHandle = INVALID_HANDLE_VALUE;

  final _setupapi = sp.SetupAPI(DynamicLibrary.open('setupapi.dll'));

  final _hidSdi = hid.HidSdi(DynamicLibrary.open('hid.dll'));

  @override
  List<dynamic> listDevices() {
    var hidInterfaceClassGuid = calloc<GUID>()
      ..ref.setGUID('{4D1E55B2-F16F-11CF-88CB-001111000030}');

    var deviceInfoSetPtr = _setupapi.SetupDiGetClassDevsW(
      hidInterfaceClassGuid.cast(),
      nullptr,
      nullptr,
      sp.DIGCF_PRESENT | sp.DIGCF_DEVICEINTERFACE,
    );

    var deviceList = _iterateDevice(deviceInfoSetPtr, hidInterfaceClassGuid).toList();

    _setupapi.SetupDiDestroyDeviceInfoList(deviceInfoSetPtr);
    calloc.free(hidInterfaceClassGuid);
    return deviceList;
  }

  Iterable<Map<String, dynamic>> _iterateDevice(Pointer<Void> deviceInfoSetPtr, Pointer<GUID> hidInterfaceClassGuid) sync* {
    var requiredSizePtr = calloc<Uint32>();
    var devicInterfaceDataPtr = calloc<sp.SP_DEVICE_INTERFACE_DATA>();
    devicInterfaceDataPtr.ref.cbSize = sizeOf<sp.SP_DEVICE_INTERFACE_DATA>();
    
    for (var index = 0; _setupapi.SetupDiEnumDeviceInterfaces(deviceInfoSetPtr, nullptr, hidInterfaceClassGuid.cast(), index, devicInterfaceDataPtr) == TRUE; index++) {
      // Get requiredSize
      _setupapi.SetupDiGetDeviceInterfaceDetailW(deviceInfoSetPtr, devicInterfaceDataPtr, nullptr, 0, requiredSizePtr, nullptr);
    
      var detailDataMemoryPtr = calloc<Uint16>(requiredSizePtr.value);
      var devHandle = INVALID_HANDLE_VALUE;
    
      try {
        var deviceInterfaceDetailDataPtr = Pointer<sp.SP_DEVICE_INTERFACE_DETAIL_DATA_W>.fromAddress(detailDataMemoryPtr.address);
        deviceInterfaceDetailDataPtr.ref.cbSize = sizeOf<sp.SP_DEVICE_INTERFACE_DETAIL_DATA_W>();
    
        var getDeviceInterfaceDetail = _setupapi.SetupDiGetDeviceInterfaceDetailW(deviceInfoSetPtr, devicInterfaceDataPtr, deviceInterfaceDetailDataPtr, requiredSizePtr.value, nullptr, nullptr);
        if (getDeviceInterfaceDetail != TRUE) {
          print('SetupDiGetDeviceInterfaceDetailW error ${GetLastError()}');
          continue;
        }
        // FIXME Utf16.decode
        var devicePath = utf8.decode(deviceInterfaceDetailDataPtr.getDevicePathData(requiredSizePtr.value));
    
        devHandle = CreateFile(devicePath.toNativeUtf16(), 0, FILE_SHARE_READ | FILE_SHARE_WRITE, nullptr, OPEN_EXISTING, 0, NULL);
        if (devHandle == INVALID_HANDLE_VALUE) {
          print('CreateFile error ${GetLastError()}');
          continue;
        }
        var devHandlePtr = Pointer<Void>.fromAddress(devHandle);
    
        yield {
          'path': devicePath,
          ..._getAttributes(devHandlePtr),
          ..._getPreparsedData(devHandlePtr),
        };
      } finally {
        calloc.free(detailDataMemoryPtr);
        if (devHandle != INVALID_HANDLE_VALUE) {
          CloseHandle(devHandle);
        }
      }
    }
    
    calloc.free(requiredSizePtr);
    calloc.free(devicInterfaceDataPtr);
  }

  Map<String, dynamic> _getAttributes(Pointer<Void> devHandlePtr) {
    var res = <String, dynamic>{};

    var attributesPtr = calloc<hid.HIDD_ATTRIBUTES>();
    if (_hidSdi.HidD_GetAttributes(devHandlePtr, attributesPtr) == TRUE) {
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

  Map<String, dynamic> _getPreparsedData(Pointer<Void> devHandlePtr) {
    var res = <String, dynamic>{};

    var preparsedDataRefPtr = calloc<Pointer<hid.HIDP_PREPARSED_DATA>>();
    if (_hidSdi.HidD_GetPreparsedData(devHandlePtr, preparsedDataRefPtr) == TRUE) {
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
    _devHandle = CreateFile(
      path.toNativeUtf16(),
      GENERIC_READ | GENERIC_WRITE,
      FILE_SHARE_READ | FILE_SHARE_WRITE,
      nullptr,
      OPEN_EXISTING,
      0,
      NULL,
    );
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

extension Pointer_SP_DEVICE_INTERFACE_DETAIL_DATA_W on Pointer<sp.SP_DEVICE_INTERFACE_DETAIL_DATA_W> {
  Uint16List getDevicePathData(int requiredSize) => Pointer<Uint16>.fromAddress(address).asTypedList(requiredSize).sublist(2);
}