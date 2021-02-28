import 'dart:typed_data';

import '../lib/logic_conf.dart';

final k380_seq_fkeys_on = Uint8List.fromList([0x10, 0xff, 0x0b, 0x1e, 0x00, 0x00, 0x00]);
final k380_seq_fkeys_off = Uint8List.fromList([0x10, 0xff, 0x0b, 0x1e, 0x01, 0x00, 0x00]);

void main(List<String> arguments) {
  var path = '';
  if (!LogicConf.openDevice(path)) {
    print('openDevice error');
    return;
  };

  var length = LogicConf.sendData(k380_seq_fkeys_off);
  if (length != k380_seq_fkeys_off.length) {
    print('sendData error');
  } else {
    print('sendData success');
  }

  LogicConf.closeDevice();
}
