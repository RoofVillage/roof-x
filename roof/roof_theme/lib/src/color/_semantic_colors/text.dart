import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofTextColor extends SemanticTextColor<RoofThemeOption> {
  RoofTextColor(RoofThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => forThemeOption({
        RoofThemeOption.light: colors.brandBlue,
        RoofThemeOption.dark: colors.brandBlueAccent,
      });

  @override
  Color get actionDisabled => colors.brandBlueFade;

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
  Color get onNotifyBackground => colors.white;

  @override
  Color get bad => colors.red;

  @override
  Color get brand => colors.brandRed;

  @override
  Color get good => forThemeOption({
        RoofThemeOption.light: colors.green,
        RoofThemeOption.dark: colors.darkGreen,
      });

  @override
  Color get inputActive => forThemeOption({
        RoofThemeOption.light: colors.grayDark,
        RoofThemeOption.dark: colors.grayLight,
      });

  @override
  Color get inputDisabled => forThemeOption({
        RoofThemeOption.light: colors.grayMidLight,
        RoofThemeOption.dark: colors.grayMidDark,
      });

  @override
  Color get inputPlaceholder => forThemeOption({
        RoofThemeOption.light: colors.grayLight,
        RoofThemeOption.dark: colors.grayDark,
      });

  @override
  Color get warn => forThemeOption({
        RoofThemeOption.light: colors.yellow,
        RoofThemeOption.dark: colors.darkYellow,
      });

  @override
  Color get generalPrimary => forThemeOption({
        RoofThemeOption.light: colors.black,
        RoofThemeOption.dark: colors.grayLight,
      });

  @override
  Color get generalSecondary => forThemeOption({
        RoofThemeOption.light: colors.grayMidDark,
        RoofThemeOption.dark: colors.grayDark,
      });
}
