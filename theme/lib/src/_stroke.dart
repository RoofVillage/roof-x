import 'package:flutter/material.dart';

import 'color.dart';
import 'option.dart';

class RoofStrokeColor {
  RoofThemeOption _current;

  Color get light {
    final opacity = 0.1;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3.withOpacity(opacity);
      case RoofThemeOption.dark:
        return RoofColor.white1.withOpacity(opacity);
    }
    return null;
  }

  Color get focus {
    final opacity = 0.2;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3.withOpacity(opacity);
      case RoofThemeOption.dark:
        return RoofColor.white1.withOpacity(opacity);
    }
    return null;
  }

  Color get transitionAction {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue;
      case RoofThemeOption.dark:
        return RoofColor.blue;
    }
    return null;
  }

  Color get alert {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.alert;
      case RoofThemeOption.dark:
        return RoofColor.alert;
    }
    return null;
  }

  RoofStrokeColor(this._current);
}
