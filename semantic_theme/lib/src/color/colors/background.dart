import 'package:flutter/material.dart';
import 'package:semantic_theme/src/color/colors/_inactive.dart';

import '_background_actions.dart';
import '_notify.dart';
import '_semantic_color.dart';

abstract class SemanticBackgroundColor<T> extends SemanticColor<T>
    with NotifyColors, BackgroundActionColors, InactiveColors {
  SemanticBackgroundColor(T currentThemeOption) : super(currentThemeOption);

  Color get general;
  Color get raised;
  Color get neutralContrast;

  Color get brand;
  Color get scrim;
}
