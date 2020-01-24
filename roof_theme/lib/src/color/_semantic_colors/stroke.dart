import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofStrokeColor extends SemanticStrokeColor<RoofThemeOption> {
  RoofStrokeColor(RoofThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.brandBlue;

  @override
  Color get actionSecondary => colors.brandBlue;

  @override
  Color get actionDisabled => colors.brandBlueFade;

  @override
  Color get focus => forThemeOption({
        RoofThemeOption.light: colors.gray3,
        RoofThemeOption.dark: colors.gray2,
      });

  @override
  Color get light => forThemeOption({
        RoofThemeOption.light: colors.gray1,
        RoofThemeOption.dark: colors.gray4,
      });

  @override
  Color get good => forThemeOption({
        RoofThemeOption.light: colors.green,
        RoofThemeOption.dark: colors.darkGreen,
      });

  @override
  Color get bad => colors.red;

  @override
  Color get warn => forThemeOption({
        RoofThemeOption.light: colors.yellow,
        RoofThemeOption.dark: colors.darkYellow,
      });
}
