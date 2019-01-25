import 'package:flutter/material.dart';
import 'package:spec/color.dart';

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
        return RoofColor.white2;
    }
    return null;
  }

  double get iconPressedOpacity {
    return 230;
  }

  RoofIconColor(this._current);
}
