import 'package:flutter/material.dart';
import 'package:spec/color.dart';

import 'option.dart';

class RoofTypeColor {
  RoofThemeOption _current;

  Color get brand {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.red;
      case RoofThemeOption.dark:
        return RoofColor.red;
    }
    return null;
  }

  Color get primary {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3;
      case RoofThemeOption.dark:
        return RoofColor.white1;
    }
    return null;
  }

  Color get secondary {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.gray4;
      case RoofThemeOption.dark:
        return RoofColor.gray2;
    }
    return null;
  }

  Color get fill {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black2;
      case RoofThemeOption.dark:
        return RoofColor.white1;
    }
    return null;
  }

  RoofTypeColor(this._current);
}
