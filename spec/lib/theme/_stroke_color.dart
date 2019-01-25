import 'package:flutter/material.dart';
import 'package:spec/color.dart';

import 'option.dart';

class RoofStrokeColor {
  RoofThemeOption _current;

  Color get light {
    final alpha = 20;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3.withAlpha(alpha);
      case RoofThemeOption.dark:
        return RoofColor.white1.withAlpha(alpha);
    }
    return null;
  }

  RoofStrokeColor(this._current);
}
