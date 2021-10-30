import 'package:flutter/material.dart';

class ColorConfig {
  static Color getTagColor(String color) {
    if (color == 'red') {
      return const Color(0xffff6279);
    } else if (color == 'green') {
      return const Color(0xff00d4a3);
    }else if (color == 'yellow') {
      return const Color(0xffffba80);
    }
    return const Color(0xffFFFFFF);
  }
}
