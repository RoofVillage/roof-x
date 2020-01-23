import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:theme/src/roof_theme_option.dart';

import '../../../_constants/_colors.dart' as colors;

class RoofIconColor extends SemanticIconColor<RoofThemeOption> {
  RoofIconColor(RoofThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.brandBlue;

  @override
  Color get actionSecondary => colors.brandBlue;

  @override
  Color get actionDisabled => forThemeOption({
        RoofThemeOption.light: colors.gray2,
        RoofThemeOption.dark: colors.gray3,
      });

  @override
  Color get inactive => forThemeOption({
        RoofThemeOption.light: colors.gray2,
        RoofThemeOption.dark: colors.gray3,
      });

  @override
  Color get logo => colors.brandRed;

  @override
  Color get nav => colors.brandRed;

  @override
  Color get generalPrimary => forThemeOption({
        RoofThemeOption.light: colors.black3,
        RoofThemeOption.dark: colors.white2,
      });

  @override
  Color get generalSecondary => forThemeOption({
        RoofThemeOption.light: colors.gray4,
        RoofThemeOption.dark: colors.gray1,
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
