import 'package:flutter/material.dart';

import 'utils/index.dart';
import 'option.dart';

class RoofBorderColor {
  RoofThemeOption _current;

  Color get submitButton {
    switch (_current) {
      case RoofThemeOption.light:
        return Colors.transparent;
      case RoofThemeOption.dark:
        return Colors.transparent;
    }
    return null;
  }

  Color get transitionButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue;
      case RoofThemeOption.dark:
        return RoofColor.blue;
    }
    return null;
  }

  Color get inactiveButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue.withAlpha(100);
      case RoofThemeOption.dark:
        return RoofColor.blue.withAlpha(100);
    }
    return null;
  }

  RoofBorderColor(this._current);
}
