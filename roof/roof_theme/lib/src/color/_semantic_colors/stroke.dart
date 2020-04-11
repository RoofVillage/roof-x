import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofStrokeColor extends SemanticStrokeColor<RoofThemeOption> {
  RoofStrokeColor(RoofThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => forThemeOption({
        RoofThemeOption.light: colors.brandBlue,
        RoofThemeOption.dark: colors.brandBlueAccent,
      });

  @override
  Color get actionSecondary => forThemeOption({
        RoofThemeOption.light: colors.brandBlue.withOpacity(.2),
        RoofThemeOption.dark: colors.brandBlueAccent.withOpacity(.16),
      });

  @override
  Color get actionDisabled => colors.brandBlueFade;

  @override
  Color get light => forThemeOption({
        RoofThemeOption.light: colors.grayDark.withOpacity(.08),
        RoofThemeOption.dark: colors.blackMid,
      });

  @override
  Color get medium => forThemeOption({
        RoofThemeOption.light: colors.grayLight,
        RoofThemeOption.dark: colors.blackLight,
      });

  @override
  Color get strong => forThemeOption({
        RoofThemeOption.light: colors.grayMidDark,
        RoofThemeOption.dark: colors.grayMidLight,
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
