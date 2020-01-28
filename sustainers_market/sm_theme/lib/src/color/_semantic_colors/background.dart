import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmBackgroundColor extends SemanticBackgroundColor<SmThemeOption> {
  SmBackgroundColor(SmThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.white1;

  @override
  Color get actionSecondary => colors.brandGreen;

  @override
  Color get actionDisabled => colors.brandGreenFade;

  @override
  Color get brand => colors.brandGreen;

  @override
  Color get generalPrimary => forThemeOption({
        SmThemeOption.light: colors.white1,
      });

  @override
  Color get generalSecondary => forThemeOption({
        SmThemeOption.light: colors.white2,
      });

  @override
  Color get neutralContrast => forThemeOption({
        SmThemeOption.light: colors.white2,
      });

  @override
  Color get inactive => forThemeOption({
        SmThemeOption.light: colors.white2,
      });

  @override
  Color get inputBackground => forThemeOption({
        SmThemeOption.light: colors.white2,
      });

  @override
  Color get inputForeground => forThemeOption({
        SmThemeOption.light: colors.white1,
      });

  @override
  Color get scrim => forThemeOption({
        SmThemeOption.light: Colors.black.withOpacity(0.2),
      });

  @override
  Color get good => forThemeOption({
        SmThemeOption.light: Colors.green,
      });

  @override
  Color get bad => Colors.red;

  @override
  Color get warn => forThemeOption({
        SmThemeOption.light: Colors.yellow,
      });
}
