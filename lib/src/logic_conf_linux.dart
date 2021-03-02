import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'logic_conf_interface.dart';
import 'linux/libc.dart';

class LogicConfLinux extends LogicConfPlatform {
  int _devDescriptor = -1;

  final _libc = LibC(DynamicLibrary.open('libc.so.6'));

  @override
  List listDevices() {
    // TODO: implement listDevices
    throw UnimplementedError();
  }

  @override
  bool openDevice(String path) {
    var nativeUtf8 = path.toNativeUtf8();
    var descriptor = _libc.open2(nativeUtf8.cast(), O_RDWR);
    malloc.free(nativeUtf8);

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
