import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/index.dart';

class SmKeyboardBrightness extends SemanticKeyboardBrightness {
  SmKeyboardBrightness(currentThemeOption) : super(currentThemeOption);

  @override
  Brightness get value => forThemeOption({
        SmThemeOption.dark: Brightness.light,
      });
}
