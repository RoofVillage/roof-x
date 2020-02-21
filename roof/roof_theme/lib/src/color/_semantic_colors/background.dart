import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofBackgroundColor extends SemanticBackgroundColor<RoofThemeOption> {
  RoofBackgroundColor(RoofThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.brandBlue;

  @override
  Color get actionSecondary => colors.brandBlue;

  @override
  Color get actionDisabled => colors.brandBlueFade;

  @override
  Color get brand => colors.brandRed;

  @override
  Color get generalPrimary => forThemeOption({
        RoofThemeOption.light: colors.white1,
        RoofThemeOption.dark: colors.black2,
      });

  @override
  Color get generalSecondary => forThemeOption({
        RoofThemeOption.light: colors.white2,
        RoofThemeOption.dark: colors.black1,
      });

  @override
  Color get neutralContrast => forThemeOption({
        RoofThemeOption.light: colors.gray2,
        RoofThemeOption.dark: colors.gray3,
      });

  @override
  Color get inactive => forThemeOption({
        RoofThemeOption.light: colors.gray1,
        RoofThemeOption.dark: colors.gray4,
      });

  @override
  Color get inputBackground => forThemeOption({
        RoofThemeOption.light: colors.white2,
        RoofThemeOption.dark: colors.black3,
      });

  @override
  Color get inputForeground => forThemeOption({
        RoofThemeOption.light: colors.white1,
        RoofThemeOption.dark: colors.black2,
      });

  @override
  Color get scrim => forThemeOption({
        RoofThemeOption.light: Colors.black.withOpacity(0.2),
        RoofThemeOption.dark: Colors.black.withOpacity(0.6),
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
