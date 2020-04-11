import 'package:flutter/material.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';
import 'package:semantic_theme/src/_utils/value_for_theme_option.dart';

abstract class SemanticLogoLibrary<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticLogoLibrary(T currentThemeOption) : super(currentThemeOption);

  Widget get full;
  Widget get icon;
}
