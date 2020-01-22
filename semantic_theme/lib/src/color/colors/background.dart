import 'package:flutter/material.dart';
import 'package:semantic_theme/src/option.dart';

import '_semantic_color.dart';

abstract class SemanticBackgroundColor extends SemanticColor {
  SemanticBackgroundColor(ThemeOption currentThemeOption)
      : super(currentThemeOption);

  Color get inputForeground;
  Color get inputBackground;

  Color get generalPrimary;
  Color get generalSecondary;

  Color get actionPrimary;
  Color get actionSecondary;

  Color get inactive;
  Color get disabled;

  Color get good;
  Color get warn;
  Color get bad;

  Color get brand;
  Color get scrim;
}
