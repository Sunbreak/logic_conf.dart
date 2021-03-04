import 'dart:typed_data';

import 'package:logic_conf/logic_conf.dart';

const VENDOR_LOGIC = 0x046D;

const PRODUCT_K380 = 0xB342;
const PRODUCT_K480_ALT2 = 0xB33D;

const products = [PRODUCT_K380, PRODUCT_K480_ALT2];

const USAGEPAGE_CUSTOM = 0xFF00;

final k380_seq_fkeys_on =
    Uint8List.fromList([0x10, 0xff, 0x0b, 0x1e, 0x00, 0x00, 0x00]);
final k380_seq_fkeys_off =
    Uint8List.fromList([0x10, 0xff, 0x0b, 0x1e, 0x01, 0x00, 0x00]);

void main(List<String> arguments) {
  if (arguments.length != 1 || (arguments[0] != 'on' && arguments[0] != 'off')) {
    print('Choose "on" or "off" please');
    return;
  }

  var logicDevices = LogicConf.listDevices()
      .where((e) => e['vendorId'] == VENDOR_LOGIC)
      .toList();
  if (logicDevices.isEmpty) {
    print('Logic HID device not found');
    return;
  }

  var k380 = logicDevices.cast<dynamic?>().firstWhere((e) {
    return products.contains(e['productId']) &&
        e['usagePage'] == USAGEPAGE_CUSTOM &&
        e['usage'] == 1;
  }, orElse: () => null);
  if (k380 == null) {
    print('K380 not found');
    return;
  }

  if (!LogicConf.openDevice(k380['path'])) {
    print('K380 access denied');
    return;
  }

  var data = arguments[0] == 'on' ? k380_seq_fkeys_on : k380_seq_fkeys_off;
  var sendData = LogicConf.sendData(data);
  if (sendData != data.length) {
    print('K380 config error');
  } else {
    print('K380 config success');
  }

  LogicConf.closeDevice();
}
