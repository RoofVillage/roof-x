import 'package:flutter/material.dart';

import '_color.dart' as color;
import 'option.dart';

class RoofStrokeColor {
  RoofThemeOption _current;

  Color get light {
    final opacity = 0.1;
    switch (_current) {
      case RoofThemeOption.light:
        return color.black3.withOpacity(opacity);
      case RoofThemeOption.dark:
        return color.white1.withOpacity(opacity);
    }
    return null;
  }

  Color get focus {
    final opacity = 0.2;
    switch (_current) {
      case RoofThemeOption.light:
        return color.black3.withOpacity(opacity);
      case RoofThemeOption.dark:
        return color.white1.withOpacity(opacity);
    }
    return null;
  }

  Color get secondaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.blue;
      case RoofThemeOption.dark:
        return color.blue;
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
