import 'package:flutter/material.dart';
import 'package:spec/theme/option.dart';

import 'utils/_color.dart';

class RoofBackgroundColor {
  RoofThemeOption _current;

  Color get brand {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1;
      case RoofThemeOption.dark:
        return RoofColor.black2;
    }
    return null;
  }

  Color get general {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white2;
      case RoofThemeOption.dark:
        return RoofColor.black3;
    }
    return null;
  }

  RoofBackgroundColor(this._current);
}
