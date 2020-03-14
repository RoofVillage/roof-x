import 'package:flutter/services.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';
import 'package:semantic_theme/src/_utils/value_for_theme_option.dart';

abstract class SemanticSystemUiOverlayStyle<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticSystemUiOverlayStyle(T currentThemeOption)
      : super(currentThemeOption);

  SystemUiOverlayStyle get value;
}
