import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/index.dart';

class RoofKeyboardBrightness extends SemanticKeyboardBrightness {
  RoofKeyboardBrightness(currentThemeOption) : super(currentThemeOption);

  @override
  Brightness get value => forThemeOption({
        RoofThemeOption.dark: Brightness.dark,
        RoofThemeOption.light: Brightness.light,
      });
}
