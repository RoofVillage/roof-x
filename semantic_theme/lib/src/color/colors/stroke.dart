import 'package:flutter/material.dart';

import '_background_actions.dart';
import '_notify.dart';
import '_semantic_color.dart';

abstract class SemanticStrokeColor<T> extends SemanticColor<T>
    with NotifyColors, BackgroundActionColors {
  SemanticStrokeColor(T currentThemeOption) : super(currentThemeOption);

  Color get light;
  Color get medium;
  Color get strong;
}
