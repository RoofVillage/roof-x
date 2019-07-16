import 'package:flutter/material.dart';
import 'package:color/index.dart' as color;

import 'option.dart';

class RoofBackgroundColor {
  RoofThemeOption _current;

  Color get brand {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.black1;
    }
    return null;
  }

  Color get inputForeground {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.black2;
    }
    return null;
  }

  Color get inputBackground {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white2;
      case RoofThemeOption.dark:
        return color.black1;
    }
    return null;
  }

  Color get generalPrimary {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white2;
      case RoofThemeOption.dark:
        return color.black2;
    }
    return null;
  }

  Color get generalSecondary {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.black1;
    }
    return null;
  }

  Color get scrim {
    switch (_current) {
      case RoofThemeOption.light:
        return Colors.black.withOpacity(0.2);
      case RoofThemeOption.dark:
        return Colors.black.withOpacity(0.6);
    }
    return null;
  }

  Color get primaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.blue;
      case RoofThemeOption.dark:
        return color.blue;
    }
    return null;
  }

  Color get secondaryAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.white1;
      case RoofThemeOption.dark:
        return color.black1;
    }
    return null;
  }

  Color get errorAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.alert;
      case RoofThemeOption.dark:
        return color.alert;
    }
    return null;
  }

  Color get inactiveAction {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray4;
      case RoofThemeOption.dark:
        return color.blue.withAlpha(100);
    }
    return null;
  }

  Color get disabled {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray4;
      case RoofThemeOption.dark:
        return color.gray4;
    }
    return null;
  }

  Color get tagDefault {
    switch (_current) {
      case RoofThemeOption.light:
        return color.gray3;
      case RoofThemeOption.dark:
        return color.white1.withAlpha(20);
    }
    return null;
  }

  Color get tagGood {
    switch (_current) {
      case RoofThemeOption.light:
        return color.lightGreen;
      case RoofThemeOption.dark:
        return color.white1.withAlpha(20);
    }
    return null;
  }

  Color get tagAlert {
    switch (_current) {
      case RoofThemeOption.light:
        return color.alert_dark;
      case RoofThemeOption.dark:
        return color.white1.withAlpha(20);
    }
    return null;
  }

  Color get emergency {
    switch (_current) {
      case RoofThemeOption.light:
        return color.emergency;
      case RoofThemeOption.dark:
        return color.emergency;
    }
    return null;
  }

  RoofBackgroundColor(this._current);
}
