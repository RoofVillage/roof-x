import 'package:flutter/material.dart';

import '_color.dart' as color;
import 'option.dart';

class RoofIconColor {
  RoofThemeOption _current;

  Color get nav {
    switch (_current) {
      case RoofThemeOption.light:
        return color.black2;
      case RoofThemeOption.dark:
        return color.white1;
    }
    return null;
  }

  Color get general {
    switch (_current) {
      case RoofThemeOption.light:
        return color.black1;
      case RoofThemeOption.dark:
        return color.gray2;
    }
    return null;
  }

  Color get logo {
    switch (_current) {
      case RoofThemeOption.light:
        return color.red;
      case RoofThemeOption.dark:
        return color.red;
    }
    return null;
  }

  Color get transitionAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.blue;
      case RoofThemeOption.dark:
        return color.blue;
    }
    return null;
  }

  RoofIconColor(this._current);
}
