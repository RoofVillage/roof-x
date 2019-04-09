import 'package:flutter/material.dart';

import 'color.dart';
import 'option.dart';

class RoofIconColor {
  RoofThemeOption _current;

  Color get nav {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black2;
      case RoofThemeOption.dark:
        return RoofColor.white1;
    }
    return null;
  }

  Color get general {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black1;
      case RoofThemeOption.dark:
        return RoofColor.gray2;
    }
    return null;
  }

  Color get logo {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.red;
      case RoofThemeOption.dark:
        return RoofColor.red;
    }
    return null;
  }

  Color get action {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue;
      case RoofThemeOption.dark:
        return RoofColor.blue;
    }
    return null;
  }

  // double get iconPressedOpacity {
  //   return 230;
  // }

  RoofIconColor(this._current);
}
