import 'package:flutter/material.dart';
import 'package:spec/theme/option.dart';

import 'utils/_color.dart';

class RoofActionColor {
  RoofThemeOption _current;

  Color get submit {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue;
      case RoofThemeOption.dark:
        return RoofColor.blue;
    }
    return null;
  }

  Color get transition {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1;
      case RoofThemeOption.dark:
        return RoofColor.black2;
    }
    return null;
  }

  Color get inactive {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.gray4;
      case RoofThemeOption.dark:
        return RoofColor.gray2;
    }
    return null;
  }

  RoofActionColor(this._current);
}
