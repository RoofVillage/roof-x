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
  Color get onActionSecondaryBackground => colors.white1;

  @override
  Color get onActionDisabledBackground => colors.white2;

  @override
  Color get actionDisabled => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get inactive => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get logo => colors.brandGreen;

  @override
  Color get nav => colors.brandGreen;

  @override
  Color get generalPrimary => forThemeOption({
        SmThemeOption.light: colors.white1,
      });

  @override
  Color get generalSecondary => forThemeOption({
        SmThemeOption.light: Colors.grey,
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
