import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmStrokeColor extends SemanticStrokeColor<SmThemeOption> {
  SmStrokeColor(SmThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get actionPrimary => colors.brandGreen;

  @override
  Color get actionSecondary => colors.white1;

  @override
  Color get actionDisabled => colors.brandGreenFade;

  @override
  Color get focus => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get light => forThemeOption({
        SmThemeOption.light: Colors.white.withAlpha(100),
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
