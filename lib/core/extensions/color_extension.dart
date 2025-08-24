import 'package:flutter/material.dart';

extension ColorX on Color {
  String toHex() {
    final alpha = a;
    final red = r;
    final green = g;
    final blue = b;

    return '#$alpha$red$green$blue'.toUpperCase();
  }
}
