import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color indigo900 = fromHex('#0a008c');

  static Color whiteA700 = fromHex('#ffffff');
  static Color gray400 = fromHex('#b0b0b0');

  static Color gray500 = fromHex('#a6a6a6');

  static Color orange900 = fromHex('#cc5903');

  static Color bluegray100 = fromHex('#d1d1d1');
  static Color gray600 = fromHex('#696e70');

  static Color bluegray800 = fromHex('#4a4f52');

  static Color black900 = fromHex('#000000');


  static Color green6320 = fromHex('#1D6320');


  static Color gray200 = fromHex('#f0f0f0');
  static Color gray601 = fromHex('#918282');



  static Color black9000f = fromHex('#0f000000');





  static Color black901 = fromHex('#0f0f0f');

  static Color black90029 = fromHex('#29000000');





  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
