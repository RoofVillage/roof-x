import 'package:flutter/material.dart';

import '../_utils/value_for_theme_option.dart';
import '../_utils/theme_option_dependent.dart';

abstract class ShadowLibrary<T> extends ThemeOptionDependent<T>
    with ValueForThemeOption<BoxShadow, T> {
  ShadowLibrary(T currentThemeOption) : super(currentThemeOption);

  BoxShadow get small;
  BoxShadow get medium;
  BoxShadow get large;
}
