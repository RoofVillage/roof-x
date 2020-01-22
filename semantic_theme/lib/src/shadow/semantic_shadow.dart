import 'package:flutter/material.dart';
import 'package:semantic_theme/src/option.dart';

import '../_utils/value_for_theme_option.dart';
import '../_utils/theme_option_aware.dart';

abstract class SemanticShadow extends ThemeOptionDependent
    with ValueForThemeOption {
  SemanticShadow(ThemeOption currentThemeOption) : super(currentThemeOption);

  BoxShadow shadowForThemeOption({
    BoxShadow forDark,
    BoxShadow forLight,
  }) =>
      valueForThemeOption<BoxShadow>(
        forLight: forLight,
        forDark: forDark,
      );
}

// BoxShadow get shadow {
//   double blurRadius;
//   double opacity;
//   switch (currentThemeOption) {
//     case ThemeOption.light:
//       blurRadius = 12;
//       opacity = 0.2;
//       break;
//     case ThemeOption.dark:
//       blurRadius = 16;
//       opacity = 0.1;
//       break;
//   }
//   return BoxShadow(
//     color: color.background.scrim.withOpacity(opacity),
//     blurRadius: blurRadius,
//     offset: Offset(0, 5),
//   );
// }
