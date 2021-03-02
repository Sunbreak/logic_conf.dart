import 'dart:io';
import 'dart:typed_data';

import 'src/logic_conf_interface.dart';
import 'src/logic_conf_macos.dart';
import 'src/logic_conf_linux.dart';
import 'src/logic_conf_windows.dart';

bool _manualDartRegistrationNeeded = true;

LogicConfPlatform get _platform {
  // This is to manually endorse Dart implementations until automatic
  // registration of Dart plugins is implemented. For details see
  // https://github.com/flutter/flutter/issues/52267.
  if (_manualDartRegistrationNeeded) {
    // Only do the initial registration if it hasn't already been overridden
    // with a non-default instance.
    if (Platform.isWindows) {
      LogicConfPlatform.instance = LogicConfWindows();
    } if (Platform.isMacOS) {
      LogicConfPlatform.instance = LogicConfMacos();
    } else if (Platform.isLinux) {
      LogicConfPlatform.instance = LogicConfLinux();
    }
    _manualDartRegistrationNeeded = false;
  }

  return LogicConfPlatform.instance!;
}

class LogicConf {
  static List<dynamic> listDevices() => _platform.listDevices();

  static bool openDevice(String path) => _platform.openDevice(path);

  static void closeDevice() => _platform.closeDevice();

  static int sendData(Uint8List data) => _platform.sendData(data);
}
