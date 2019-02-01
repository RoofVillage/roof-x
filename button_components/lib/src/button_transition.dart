import 'package:theme/index.dart';
import 'package:icon_library/index.dart';

import '_button.dart';

class RoofTransitionButton extends RoofButton {
  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.transitionButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.transitionAction;
      };

  RoofTransitionButton(
      {Function onTap, String text, StandardIconReference iconReference})
      : super(
          onTap: onTap,
          text: text,
          iconReference: iconReference,
        );
}
