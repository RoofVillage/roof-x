import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofIconColor extends SemanticIconColor<RoofThemeOption> {
  RoofIconColor(RoofThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => forThemeOption({
    RoofThemeOption.light: colors.brandBlue,
    RoofThemeOption.dark: colors.brandBlueAccent,
  });

  @override
  Color get onActionPrimaryBackground => colors.white;

  @override
  Color get onActionSecondaryBackground => forThemeOption({
    RoofThemeOption.light: colors.brandBlue,
    RoofThemeOption.dark: colors.brandBlueAccent,
  });
  
  @override
  Color get onActionDisabledBackground => colors.whiteMid;

  @override
  Color get actionDisabled => forThemeOption({
        RoofThemeOption.light: colors.grayMidLight,
        RoofThemeOption.dark: colors.grayMidDark,
      });

  @override
  Color get inactive => forThemeOption({
        RoofThemeOption.light: colors.grayMidLight,
        RoofThemeOption.dark: colors.grayMidDark,
      });

  @override
  Color get logo => colors.brandRed;

  @override
  Color get nav => colors.brandRed;

  @override
  Color get generalPrimary => forThemeOption({
        RoofThemeOption.light: colors.blackLight,
        RoofThemeOption.dark: colors.whiteMid,
      });

  @override
  Color get generalSecondary => forThemeOption({
        RoofThemeOption.light: colors.grayMidDark,
        RoofThemeOption.dark: colors.grayMidDark,
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
