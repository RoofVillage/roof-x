import 'package:flutter/services.dart';

enum HapticOption { light, medium, heavy, click }

class Haptic {
  static Future<void> triggerWith(HapticOption option) async {
    String typeString = "HapticFeedbackType.";

    switch (option) {
      case HapticOption.light:
        typeString += "lightImpact";
        break;
      case HapticOption.medium:
        typeString += "mediumImpact";
        break;
      case HapticOption.heavy:
        typeString += "heavyImpact";
        break;
      case HapticOption.click:
        typeString += "selectionClick";
        break;
    }
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      typeString,
    );
  }
}
