import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmIconColor extends SemanticIconColor<SmThemeOption> {
  SmIconColor(SmThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => colors.brandGreen;

  @override
  Color get onActionPrimaryBackground => colors.brandGreen;

  @override
  Color get onActionSecondaryBackground => colors.brandGreen;

  @override
  Color get onActionDisabledBackground => colors.white2;

  @override
  Color get actionDisabled => forThemeOption({
        SmThemeOption.dark: Colors.grey,
      });

  @override
  Color get inactive => forThemeOption({
        SmThemeOption.dark: Colors.grey,
      });

  @override
  Color get logo => colors.brandGreen;

  @override
  Color get nav => colors.brandGreenFade;

  @override
  Color get generalPrimary => forThemeOption({
        SmThemeOption.dark: colors.white2,
      });

  @override
  Color get generalSecondary => forThemeOption({
        SmThemeOption.dark: Colors.grey,
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
