import 'package:flutter/material.dart';

import '_foreground_actions.dart';
import '_notify.dart';
import '_general.dart';
import '_inactive.dart';
import '_semantic_color.dart';

abstract class SemanticIconColor<T> extends SemanticColor<T>
    with InactiveColors, GeneralColors, NotifyColors, ForegroundActionColors {
  SemanticIconColor(T currentThemeOption) : super(currentThemeOption);
  
  Color get nav;
  Color get logo;
}
