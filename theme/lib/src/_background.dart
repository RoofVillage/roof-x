import 'package:flutter/material.dart';

import 'utils/index.dart';
import 'option.dart';

class RoofBackgroundColor {
  RoofThemeOption _current;

  Color get brandSolid {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1;
      case RoofThemeOption.dark:
        return RoofColor.black2;
    }
    return null;
  }

  Color get brandPrimary {
    final opacity = 0.98;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1.withOpacity(opacity);
      case RoofThemeOption.dark:
        return RoofColor.black2.withOpacity(opacity);
    }
    return null;
  }

  Color get brandSecondary {
    final opacity = 0.95;
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1.withOpacity(opacity);
      case RoofThemeOption.dark:
        return RoofColor.black2.withOpacity(opacity);
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

  Color get scrim {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.black3.withOpacity(0.7);
      case RoofThemeOption.dark:
        return RoofColor.black3.withOpacity(0.7);
    }
    return null;
  }

  Color get submitButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.blue;
      case RoofThemeOption.dark:
        return RoofColor.blue;
    }
    return null;
  }

  Color get transitionButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.white1;
      case RoofThemeOption.dark:
        return RoofColor.black2;
    }
    return null;
  }

  Color get errorButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.alert;
      case RoofThemeOption.dark:
        return RoofColor.alert;
    }
    return null;
  }

  Color get inactiveButton {
    switch (_current) {
      case RoofThemeOption.light:
        return RoofColor.gray4;
      case RoofThemeOption.dark:
        return RoofColor.blue.withAlpha(100);
    }
    return null;
  }

  RoofBackgroundColor(this._current);
}
