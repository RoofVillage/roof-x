import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmBackgroundColor extends SemanticBackgroundColor<SmThemeOption> {
  SmBackgroundColor(SmThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.brandGreenDark;

  @override
  Color get actionSecondary => colors.whiteTint;

  @override
  Color get actionDisabled => colors.white1.withOpacity(.4);

  @override
  Color get brand => colors.brandGreen;

  @override
  Color get raised => forThemeOption({
        SmThemeOption.dark: colors.black2,
      });

  @override
  Color get general => forThemeOption({
        SmThemeOption.dark: colors.black1,
      });

  @override
  Color get neutralContrast => forThemeOption({
        SmThemeOption.dark: colors.black3,
      });

  @override
  Color get inactive => forThemeOption({
        SmThemeOption.dark: Colors.grey,
      });

  @override
  Color get scrim => forThemeOption({
        SmThemeOption.dark: Colors.black.withOpacity(0.8),
      });

  @override
  Color get good => forThemeOption({
        SmThemeOption.dark: Colors.green,
      });

  @override
  Color get bad => Colors.red;

  @override
  Color get warn => forThemeOption({
        SmThemeOption.dark: Colors.yellow,
      });
}
