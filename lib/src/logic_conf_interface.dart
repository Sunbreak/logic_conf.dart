import 'dart:typed_data';

abstract class LogicConfPlatform {
  static LogicConfPlatform? _instance;

  static LogicConfPlatform? get instance => _instance;

  static set instance(LogicConfPlatform? instance) {
    _instance = instance;
  }

  List<dynamic> listDevices();

  bool openDevice(String path);

  void closeDevice();

  int sendData(Uint8List data);
}