import 'dart:async';

import 'package:flutter/services.dart';

enum HapticOption { light, medium, heavy, click }

@deprecated
Future triggerHapticWith(HapticOption option) async {
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

void triggerHaptic(HapticOption option, {void Function() and}) {
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

  SystemChannels.platform.invokeMethod(
    'HapticFeedback.vibrate',
    typeString,
  );

  and();
}
