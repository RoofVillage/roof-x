import 'package:flutter/material.dart';

class RoofTypographyStyle {
  final double fontSize;
  final FontWeight fontWeight;
  final double leading;
  final double tracking;
  final String fontFamily;

  RoofTypographyStyle(
      {@required this.fontSize,
      @required this.fontWeight,
      this.leading,
      this.tracking,
      this.fontFamily = "Azo"});

  TextStyle textStyleWithColor(Color color) {
    final height = (leading ?? fontSize) / fontSize;
    final letterSpacing = (tracking ?? 0) * fontSize / 1000;

    final style = TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color);

    return style;
  }
}
