import 'package:flutter/services.dart';

import 'option.dart';

class RoofSystem {
  RoofThemeOption _current;

  SystemUiOverlayStyle get chromeOverlayStyle {
    switch (_current) {
      case RoofThemeOption.light:
        return SystemUiOverlayStyle.dark;
      case RoofThemeOption.dark:
        return SystemUiOverlayStyle.light;
    }
    return null;
  }

  RoofSystem(this._current);
}
