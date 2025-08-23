import 'package:flutter/material.dart';

class AppTypography {
  static const String _fontFamily = 'Roboto';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semi = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static const TextStyle h1 =
      TextStyle(fontSize: 24, fontWeight: bold, fontFamily: _fontFamily);
  static const TextStyle h2 =
      TextStyle(fontSize: 20, fontWeight: bold, fontFamily: _fontFamily);
  static const TextStyle body =
      TextStyle(fontSize: 16, fontWeight: regular, fontFamily: _fontFamily);
  static const TextStyle caption =
      TextStyle(fontSize: 12, fontWeight: regular, fontFamily: _fontFamily);
}
