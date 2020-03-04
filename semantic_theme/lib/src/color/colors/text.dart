import 'package:flutter/material.dart';
import 'package:semantic_theme/src/color/colors/_general.dart';

import '_foreground_actions.dart';
import '_notify.dart';
import '_general.dart';
import '_semantic_color.dart';

abstract class SemanticTextColor<T> extends SemanticColor<T>
    with NotifyColors, GeneralColors, ForegroundActionColors {
  SemanticTextColor(T currentThemeOption) : super(currentThemeOption);

  Color get brand;

  Color get onNotifyBackground;

  Color get inputActive;
  Color get inputDisabled;
  Color get inputPlaceholder;
}
