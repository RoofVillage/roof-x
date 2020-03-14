import 'package:flutter/material.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';
import 'package:semantic_theme/src/_utils/value_for_theme_option.dart';

abstract class SemanticTypography<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticTypography(T currentThemeOption) : super(currentThemeOption);

  double get fontSize;
  FontWeight get fontWeight;
  String get fontFamily;
  List<String> get fontFamilyFallback;
  double get letterSpacing;

  TextStyle textStyle({
    @required Color color,
    FontStyle fontStyle,
    TextBaseline textBaseline,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      textBaseline: textBaseline,
    );
  }
}
