import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class RoofBackgroundColor extends SemanticBackgroundColor<RoofThemeOption> {
  RoofBackgroundColor(RoofThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => forThemeOption({
    RoofThemeOption.light: colors.brandBlue,
    RoofThemeOption.dark: colors.brandBlueAccent,
  });

  @override
  Color get actionSecondary => forThemeOption({
    RoofThemeOption.light: Colors.transparent,
    RoofThemeOption.dark: Colors.transparent,
  });

  @override
  Color get actionDisabled => colors.brandBlueFade;

  @override
  Color get brand => colors.brandRed;

  @override
  Color get raised => forThemeOption({
        RoofThemeOption.light: colors.white,
        RoofThemeOption.dark: colors.blackMid,
      });

  @override
  Color get general => forThemeOption({
        RoofThemeOption.light: colors.whiteMid,
        RoofThemeOption.dark: colors.black,
      });

  @override
  Color get neutralContrast => forThemeOption({
        RoofThemeOption.light: colors.grayMidLight,
        RoofThemeOption.dark: colors.blackLight,
      });

  @override
  Color get inactive => forThemeOption({
        RoofThemeOption.light: colors.grayLight,
        RoofThemeOption.dark: colors.grayDark,
      });

  @override
  Color get scrim => forThemeOption({
        RoofThemeOption.light: Colors.black.withOpacity(0.2),
        RoofThemeOption.dark: Colors.black.withOpacity(0.85),
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
