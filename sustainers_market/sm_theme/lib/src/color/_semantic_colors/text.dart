import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/sm_theme_option.dart';

import '../../_constants/_colors.dart' as colors;

class SmTextColor extends SemanticTextColor<SmThemeOption> {
  SmTextColor(SmThemeOption currentThemeOption) : super(currentThemeOption);

  @override
  Color get action => colors.brandGreen;

  @override
  Color get actionDisabled => colors.brandGreenFade;

  @override
  Color get onActionPrimaryBackground => colors.white1;

  @override
  Color get onActionSecondaryBackground => colors.white1;

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
        SmThemeOption.dark: Colors.green,
      });

  @override
  Color get inputActive => colors.white1;

  @override
  Color get inputDisabled => inputActive.withOpacity(.35);

  @override
  Color get inputPlaceholder => inputActive.withOpacity(.2);

  @override
  Color get warn => forThemeOption({
        SmThemeOption.dark: Colors.yellow,
      });

  @override
  Color get generalPrimary => forThemeOption({
        SmThemeOption.dark: colors.white1,
      });

  @override
  Color get generalSecondary => forThemeOption({
        SmThemeOption.dark: Colors.grey,
      });
}
