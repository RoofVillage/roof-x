import 'package:flutter/material.dart';
import 'package:spec/theme/option.dart';

import 'utils/_color.dart';

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

  Color get focus {
    final alpha = 30;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3.withAlpha(alpha);
      case RoofThemeOption.dark:
        return RoofColor.white1.withAlpha(alpha);
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

  RoofStrokeColor(this._current);
}
