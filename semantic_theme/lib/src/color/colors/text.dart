import 'package:flutter/material.dart';
import 'package:semantic_theme/src/option.dart';

import '_semantic_color.dart';

abstract class SemanticTextColor extends SemanticColor {
  SemanticTextColor(ThemeOption currentThemeOption) : super(currentThemeOption);

  Color get primary;
  Color get secondary;

  Color get inputActive;
  Color get inputDisabled;
  Color get inputPlaceholder;

  Color get brand;

  Color get actionPrimary;
  Color get actionSecondary;
  Color get actionDisabled;

  Color get good;
  Color get warn;
  Color get bad;
}
