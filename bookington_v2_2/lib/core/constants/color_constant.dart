import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray90059 = fromHex('#59353535');

  static Color blueA400 = fromHex('#0d6efd');

  static Color blueGray1000f = fromHex('#0fc5c7d3');

  static Color blueGray500 = fromHex('#74778b');

  static Color blueGray900 = fromHex('#31343b');

  static Color blue500 = fromHex('#1786f9');

  static Color blue400 = fromHex('#42A5F5');

  static Color blueGray50 = fromHex('#edeef1');

  static Color blue50 = fromHex('#d1e7fe');

  static Color blueGray40014 = fromHex('#14718096');

  static Color black900 = fromHex('#000000');

  static Color black9000c = fromHex('#0c04060f');

  static Color gray90096 = fromHex('#961f1f1f');

  static Color gray90001 = fromHex('#222326');

  static Color gray80000 = fromHex('#004b4b4b');

  static Color gray30099 = fromHex('#99d8dae2');

  static Color gray900 = fromHex('#131416');

  static Color gray500 = fromHex('#9E9E9E');

  static Color gray300 = fromHex('#d8dae2');

  static Color gray200 = fromHex('#f0f0f0');

  static Color gray50 = fromHex('#f9f9fa');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigoA200 = fromHex('#5f6aff');

  static Color indigo50 = fromHex('#e8ecf4');

  static Color yellow700 = fromHex('#fabe3c');

  static Color red500 = fromHex('#F44336');

  static Color orange500 = fromHex('#FF5722');

  static Color green500 = fromHex('#4CAF50');



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
