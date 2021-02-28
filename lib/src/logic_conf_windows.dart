import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart' as ffi;
import 'package:win32/win32.dart';

import 'logic_conf_interface.dart';

class LogicConfWindows extends LogicConfPlatform {
  var _devHandle = INVALID_HANDLE_VALUE;

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
    var dataPtr = ffi.calloc<Uint8>(data.length);
    dataPtr.asTypedList(data.length).setAll(0, data);
    var writtenLengthPtr = ffi.calloc<Uint32>();
    try {
      var writeFile = WriteFile(_devHandle, dataPtr, data.length, writtenLengthPtr, nullptr);
      if (writeFile != TRUE) {
        return -1;
      }
      return writtenLengthPtr.value;
    } finally {
      ffi.calloc.free(dataPtr);
      ffi.calloc.free(writtenLengthPtr);
    }
  }
}
