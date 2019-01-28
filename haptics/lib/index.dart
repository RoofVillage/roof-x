import 'package:flutter/services.dart';

enum RoofHapticOption { light, medium, heavy, click }

class RoofHaptic {
  static Future<void> triggerWith(RoofHapticOption option) async {
    String typeString = "HapticFeedbackType.";

    switch (option) {
      case RoofHapticOption.light:
        typeString += "lightImpact";
        break;
      case RoofHapticOption.medium:
        typeString += "mediumImpact";
        break;
      case RoofHapticOption.heavy:
        typeString += "heavyImpact";
        break;
      case RoofHapticOption.click:
        typeString += "selectionClick";
        break;
    }
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      typeString,
    );
  }
}
