import 'dart:ui';

import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofTextColor extends SemanticTextColor<RoofThemeOption> {
  RoofTextColor(RoofThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => colors.brandBlue;

  @override
  Color get actionDisabled => colors.brandBlueFade;

  @override
  Color get onActionPrimaryBackground => colors.white1;

  @override
  Color get onActionSecondaryBackground => colors.brandBlue;

  @override
  Color get onActionDisabledBackground => colors.white2;

  @override
  Color get onNotifyBackground => colors.white1;

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
        RoofThemeOption.light: colors.gray4,
        RoofThemeOption.dark: colors.gray1,
      });

  @override
  Color get inputDisabled => forThemeOption({
        RoofThemeOption.light: colors.gray2,
        RoofThemeOption.dark: colors.gray3,
      });

  @override
  Color get inputPlaceholder => forThemeOption({
        RoofThemeOption.light: colors.gray1,
        RoofThemeOption.dark: colors.gray4,
      });

  @override
  Color get warn => forThemeOption({
        RoofThemeOption.light: colors.yellow,
        RoofThemeOption.dark: colors.darkYellow,
      });

  @override
  Color get generalPrimary => forThemeOption({
        RoofThemeOption.light: colors.gray3,
        RoofThemeOption.dark: colors.gray1,
      });

  @override
  Color get generalSecondary => forThemeOption({
        RoofThemeOption.light: colors.gray2,
        RoofThemeOption.dark: colors.gray3,
      });
}
