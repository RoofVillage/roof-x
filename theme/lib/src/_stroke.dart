import 'package:flutter/material.dart';
import 'package:color/index.dart' as color;

import 'option.dart';

class RoofStrokeColor {
  RoofThemeOption _current;

  Color get light {
    final opacity1 = 0.08;
    final opacity2 = 0.04;
    switch (_current) {
      case RoofThemeOption.light:
        return color.black1.withOpacity(opacity1);
      case RoofThemeOption.dark:
        return color.white1.withOpacity(opacity2);
    }
    return null;
  }

  Color get focus {
    final opacity = 0.2;
    switch (_current) {
      case RoofThemeOption.light:
        return color.black1.withOpacity(opacity);
      case RoofThemeOption.dark:
        return color.white1.withOpacity(opacity);
    }
    return null;
  }

  Color get secondaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.blue.withOpacity(0.1);
    }
    return null;
  }

  Color get alert {
    switch (_current) {
      case RoofThemeOption.light:
        return color.alert;
      case RoofThemeOption.dark:
        return color.alert;
    }
    return null;
  }

  RoofStrokeColor(this._current);
}
