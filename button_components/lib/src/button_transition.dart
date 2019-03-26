import 'package:theme/index.dart';
import 'package:icon_library/index.dart';

import 'data/button_state.dart';
import '_button.dart';

class RoofTransitionButton extends RoofButton {
  get buttonState => ButtonState.normal;
  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.transitionButton;
      };
  get borderColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.border.transitionButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        switch (this.buttonState) {
          case ButtonState.inactive:
            return theme.color.text.transitionAction.withAlpha(180);
          case ButtonState.error:
            return theme.color.text.alert;
          case ButtonState.normal:
            return theme.color.text.transitionAction;
        }
      };

  RoofTransitionButton({
    Function onTap,
    String text,
    StandardIconReference iconReference,
  }) : super(
          onTap: onTap,
          text: text,
          iconReference: iconReference,
        );
}
