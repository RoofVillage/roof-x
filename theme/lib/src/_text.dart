import 'package:flutter/material.dart';
import 'package:color/index.dart' as color;

import 'option.dart';

class RoofTextColor {
  RoofThemeOption _current;

  Color get brand {
    switch (_current) {
      case RoofThemeOption.light:
        return color.red;
      case RoofThemeOption.dark:
        return color.red;
    }
    return null;
  }

  Color get primary {
    switch (_current) {
      case RoofThemeOption.light:
        return color.black2;
      case RoofThemeOption.dark:
        return color.gray1;
    }
    return null;
  }

  Color get secondary {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray4;
      case RoofThemeOption.dark:
        return color.gray3;
    }
    return null;
  }

  Color get placeholder {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray3;
      case RoofThemeOption.dark:
        return color.black3;
    }
    return null;
  }

  Color get fill {
    switch (_current) {
      case RoofThemeOption.light:
        return color.black2;
      case RoofThemeOption.dark:
        return color.white1;
    }
    return null;
  }

  Color get primaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.white1;
    }
    return null;
  }

  Color get secondaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.blue;
      case RoofThemeOption.dark:
        return color.blue;
    }
    return null;
  }

  Color get inactiveAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray4;
      case RoofThemeOption.dark:
        return color.gray3;
    }
    return null;
  }

  Color get alert {
    switch (_current) {
      case RoofThemeOption.light:
        return color.alert;
      case RoofThemeOption.dark:
        return color.alert;
    }
    return null;
  }

  Color get tagAlert {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.alert;
    }
    return null;
  }

  Color get tagGood {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.lightGreen;
    }
    return null;
  }

  Color get tagDefault {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.white1;
    }
    return null;
  }

  RoofTextColor(this._current);
}
