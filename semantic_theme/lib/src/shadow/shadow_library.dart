import 'package:flutter/material.dart';

import '../_utils/value_for_theme_option.dart';
import '../_utils/theme_option_dependent.dart';

abstract class SemanticShadowLibrary<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<T> {
  SemanticShadowLibrary(T currentThemeOption) : super(currentThemeOption);

  BoxShadow get card;
  BoxShadow get appBar;
  BoxShadow get small;
  BoxShadow get medium;
  BoxShadow get large;
}
