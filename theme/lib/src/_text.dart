import 'package:flutter/material.dart';

import 'utils/index.dart';
import 'option.dart';

class RoofTextColor {
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

  Color get placeholder {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.gray3;
      case RoofThemeOption.dark:
        return RoofColor.gray3;
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

  Color get submitAction {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1;
      case RoofThemeOption.dark:
        return RoofColor.white1;
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

  RoofTextColor(this._current);
}
