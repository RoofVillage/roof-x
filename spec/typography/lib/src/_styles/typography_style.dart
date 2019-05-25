import 'package:flutter/material.dart';

mixin TypographyStyle {
  double get fontSize;
  FontWeight get fontWeight;
  double get leading;
  double get tracking;
  // String get fontFamily => "Azo";
  String get fontFamily => "Circular";
  // String get fontFamily => "Open";
  // String get fontFamily => "Titillium";
  // String get fontFamily => "Nunito";
  // String get fontFamily => "Nunito-Sans";
  // String get fontFamily => "Muli";
  // String get fontFamily => "Gotham";

  TextStyle textStyleWithColor(Color color) {
    final height = (leading ?? fontSize) / fontSize;
    final letterSpacing = (tracking ?? 0) * fontSize / 1000;

    final style = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );

    return style;
  }
}
