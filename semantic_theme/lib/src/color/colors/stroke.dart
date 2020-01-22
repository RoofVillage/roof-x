import 'package:flutter/material.dart';
import 'package:semantic_theme/src/option.dart';

import '_semantic_color.dart';

abstract class SemanticStrokeColor extends SemanticColor {
  SemanticStrokeColor(ThemeOption currentThemeOption) : super(currentThemeOption);

  Color get light;
  Color get focus;

  Color get actionPrimary;
  Color get actionSecondary;

  Color get disabled;

  Color get good;
  Color get warn;
  Color get bad;
}
