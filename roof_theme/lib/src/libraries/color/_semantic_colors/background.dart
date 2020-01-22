import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class RoofBackgroundColor extends SemanticBackgroundColor {
  RoofBackgroundColor(ThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => colorForThemeOption(
        forLight: Colors.lightBlueAccent,
        forDark: Colors.blue,
      );

  @override
  // TODO: implement actionSecondary
  Color get actionSecondary => null;

  @override
  // TODO: implement bad
  Color get bad => null;

  @override
  // TODO: implement brand
  Color get brand => null;

  @override
  // TODO: implement disabled
  Color get disabled => null;

  @override
  // TODO: implement generalPrimary
  Color get generalPrimary => null;

  @override
  // TODO: implement generalSecondary
  Color get generalSecondary => null;

  @override
  // TODO: implement good
  Color get good => null;

  @override
  // TODO: implement inactive
  Color get inactive => null;

  @override
  // TODO: implement inputBackground
  Color get inputBackground => null;

  @override
  // TODO: implement inputForeground
  Color get inputForeground => null;

  @override
  // TODO: implement scrim
  Color get scrim => null;

  @override
  // TODO: implement warn
  Color get warn => null;
}
