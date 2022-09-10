import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA700B2 = fromHex('#b2ffffff');

  static Color red700 = fromHex('#d13329');

  static Color green600 = fromHex('#359766');

  static Color gray300Cc = fromHex('#cce6e3e7');

  static Color pinkA200 = fromHex('#fe5c73');

  static Color black900 = fromHex('#000000');

  static Color gray105 = fromHex('#f4f5f7');

  static Color gray103 = fromHex('#f4f6f9');

  static Color gray104 = fromHex('#f2f4f7');

  static Color teal50 = fromHex('#dfeaf2');

  static Color gray101 = fromHex('#f4f4f6');

  static Color gray102 = fromHex('#f3f3f5');

  static Color gray300 = fromHex('#e3e4e8');

  static Color gray100 = fromHex('#f4f6fa');

  static Color tealA400 = fromHex('#15dba9');

  static Color bluegray900 = fromHex('#182651');

  static Color bluegray801 = fromHex('#333b69');

  static Color indigo300 = fromHex('#7a8fd0');

  static Color bluegray800 = fromHex('#343c6a');

  static Color indigo301 = fromHex('#718ebf');

  static Color indigo100 = fromHex('#c6cfeb');

  static Color indigo200 = fromHex('#8e9ed6');

  static Color bluegray600 = fromHex('#505887');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA70026 = fromHex('#26ffffff');

  static Color indigo700 = fromHex('#2943a1');

  static Color whiteA700 = fromHex('#ffffff');

  static Color indigo500 = fromHex('#425ebd');

  static Color indigo600 = fromHex('#314ca3');

  static Color lightBlue300 = fromHex('#3D88CB');

  static Color black500 = fromHex('#313131');

  static Color black100 = fromHex('#515151');

  static Color TopCoder = Colors.limeAccent.shade700;

  static Color AtCoder = Colors.white;

  static Color HackerRank = Colors.greenAccent.shade700;

  static Color LeetCode = Colors.yellow.shade800;

  static Color CodeChef = Colors.redAccent;

  static Color CodeForces = Colors.yellowAccent;

  static Color HackerEarth = Colors.blueGrey.shade300;

  static Color InterviewBit = Colors.purpleAccent;

  static Color SPOJ = Colors.lightBlue;


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
