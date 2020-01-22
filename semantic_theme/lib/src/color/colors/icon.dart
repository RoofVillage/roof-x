import 'package:flutter/material.dart';
import 'package:semantic_theme/src/option.dart';

import '_semantic_color.dart';

abstract class SemanticIconColor extends SemanticColor {
  SemanticIconColor(ThemeOption currentThemeOption) : super(currentThemeOption);

  Color get primary;
  Color get secondary;

  Color get good;
  Color get bad;
  Color get warn;

  Color get nav;
  Color get action;
  Color get logo;

  Color get inactive;
  Color get disabled;
}
