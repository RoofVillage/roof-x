import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmStrokeColor extends SemanticStrokeColor<SmThemeOption> {
  SmStrokeColor(SmThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get actionPrimary => Colors.transparent;

  @override
  Color get actionSecondary => Colors.transparent;

  @override
  Color get actionDisabled => colors.brandGreenFade;

  @override
  Color get strong => forThemeOption({
        SmThemeOption.dark: Colors.grey,
      });

  @override
  Color get medium => forThemeOption({
        SmThemeOption.dark: Colors.white12,
      });

  @override
  Color get light => forThemeOption({
        SmThemeOption.dark: Colors.white10,
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
