import 'package:flutter/material.dart';

class RoofTypographyStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final double leading;
  final double tracking;

  RoofTypographyStyle(
      {@required this.fontSize,
      @required this.fontWeight,
      this.leading,
      this.tracking});

  TextStyle textStyleWithColor(Color color) {
    final height = (leading ?? fontSize) / fontSize;
    final letterSpacing = (tracking ?? 0) * fontSize / 1000;

    final style = TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color);

    return style;
  }
}
