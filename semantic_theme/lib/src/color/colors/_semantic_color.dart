import 'package:flutter/material.dart';
import 'package:semantic_theme/src/_utils/value_for_theme_option.dart';
import 'package:semantic_theme/src/option.dart';

import '../../_utils/theme_option_aware.dart';

abstract class SemanticColor extends ThemeOptionDependent
    with ValueForThemeOption {
  SemanticColor(ThemeOption currentThemeOption) : super(currentThemeOption);

  Color colorForThemeOption({
    Color forDark,
    Color forLight,
  }) =>
      valueForThemeOption<Color>(
        forLight: forLight,
        forDark: forDark,
      );
}
