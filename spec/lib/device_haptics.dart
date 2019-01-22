import 'package:flutter/services.dart';

class VibrateDevice {
  static Future<void> heavyImpact() async {
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.heavyImpact',
    );
  }

  static Future<void> mediumImpact() async {
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.mediumImpact',
    );
  }

  static Future<void> lightImpact() async {
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.lightImpact',
    );
  }

  static Future<void> selectionClick() async {
    await SystemChannels.platform.invokeMethod(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.selectionClick',
    );
  }

  static Future<void> vibrate() async {
    await SystemChannels.platform.invokeMethod('HapticFeedback.vibrate');
  }
}
