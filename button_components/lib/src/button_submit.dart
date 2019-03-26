import 'package:theme/index.dart';
import 'package:icon_library/index.dart';

import 'data/button_state.dart';
import '_button.dart';

class RoofSubmitButton extends RoofButton {
  get buttonState => ButtonState.normal;
  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        switch (this.buttonState) {
          case ButtonState.inactive:
            return theme.color.background.inactiveButton;
          case ButtonState.error:
            return theme.color.background.errorButton;
          case ButtonState.normal:
            return theme.color.background.submitButton;
        }
      };
  get borderColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.border.submitButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.submitAction;
      };

  RoofSubmitButton(
      {Function onTap,
      String text,
      StandardIconReference iconReference,
      ButtonState buttonState})
      : super(onTap: onTap, text: text, iconReference: iconReference);
}
