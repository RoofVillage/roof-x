import 'package:flutter/material.dart';
import 'package:semantic_theme/src/color/colors/_inactive.dart';

import '_actions.dart';
import '_notify.dart';
import '_general.dart';
import '_semantic_color.dart';

abstract class SemanticBackgroundColor<T> extends SemanticColor<T>
    with NotifyColors, GeneralColors, ActionColors, InactiveColors {
  SemanticBackgroundColor(T currentThemeOption)
      : super(currentThemeOption);

  Color get elevated;

  Color get inputForeground;
  Color get inputBackground;

  Color get brand;
  Color get scrim;
}
