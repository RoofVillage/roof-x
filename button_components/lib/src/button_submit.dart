import 'package:theme/index.dart';
import 'package:icon_library/index.dart';

import '_button.dart';

class RoofSubmitButton extends RoofButton {
  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.submitButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.submitAction;
      };

  RoofSubmitButton(
      {Function onTap, String text, StandardIconReference iconReference})
      : super(onTap: onTap, text: text, iconReference: iconReference);
}
