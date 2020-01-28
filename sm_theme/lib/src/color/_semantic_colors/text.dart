import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmTextColor extends SemanticTextColor<SmThemeOption> {
  SmTextColor(SmThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => colors.white1;

  @override
  Color get actionDisabled => Colors.grey;

  @override
  Color get onActionPrimaryBackground => colors.white1;

  @override
  Color get onActionSecondaryBackground => colors.brandGreenDark;

  @override
  Color get onActionDisabledBackground => colors.white2;

  @override
  Color get onNotifyBackground => colors.white1;

  @override
  Color get bad => Colors.red;

  @override
  Color get brand => colors.brandGreen;

  @override
  Color get good => forThemeOption({
        SmThemeOption.light: Colors.green,
      });

  @override
  Color get inputActive => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get inputDisabled => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get inputPlaceholder => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });

  @override
  Color get warn => forThemeOption({
        SmThemeOption.light: Colors.yellow,
      });

  @override
  Color get generalPrimary => forThemeOption({
        SmThemeOption.light: colors.black1,
      });

  @override
  Color get generalSecondary => forThemeOption({
        SmThemeOption.light: Colors.grey,
      });
}
