import 'package:flutter/material.dart';

abstract class SemanticTypography {
  double get fontSize;
  FontWeight get fontWeight;
  String get fontFamily;
  String get fontFamilyFallback;
  double get letterSpacing;

  Text styledText(
    String text, {
    @required Color color,
    FontStyle fontStyle,
    TextBaseline textBaseline,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamilyFallback,
        letterSpacing: letterSpacing,
        textBaseline: textBaseline,
      ),
    );
  }
}
