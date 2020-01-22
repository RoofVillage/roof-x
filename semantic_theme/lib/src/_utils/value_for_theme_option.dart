import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:semantic_theme/src/_utils/theme_option_aware.dart';

mixin ValueForThemeOption on ThemeOptionDependent {
  T valueForThemeOption<T>({
    @required T forLight,
    @required T forDark,
  }) {
    switch (currentThemeOption) {
      case ThemeOption.light:
        return forLight;
      case ThemeOption.dark:
        return forDark;
      default:
        return null;
    }
  }
}
