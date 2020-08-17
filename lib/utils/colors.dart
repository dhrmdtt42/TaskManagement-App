import 'package:flutter/material.dart';

class AppColors {
  static Color primaryWhite = Color(0xFFCADCED);
    // static Color primaryWhite = Colors.indigo[100];


  static List pieColors = [
    Colors.white24,
    Colors.white24,
    Colors.white24,
    Colors.white24,
    Colors.white24,
    Colors.white24,
  ];
  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5), spreadRadius: -5, offset: Offset(-5, -5), blurRadius: 30),
    BoxShadow(
        color: Colors.white24.withOpacity(.2),
        spreadRadius: 2,
        offset: Offset(7, 7),
        blurRadius: 20)
  ];

 static Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
