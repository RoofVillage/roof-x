import 'package:flutter/services.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';
import 'package:semantic_theme/src/_utils/value_for_theme_option.dart';

abstract class SemanticKeyboardBrightness<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticKeyboardBrightness(T currentThemeOption)
      : super(currentThemeOption);

  Brightness get value;
}
