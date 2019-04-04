import 'package:flutter/material.dart';

import 'submit_button_state_option.dart';
import '_components/submit.dart';

mixin SubmitButtonBuilder {
  RoofSubmitButton buildSubmitButton(BuildContext context,
      {@required String text,
      @required Function(BuildContext) onTap,
      SubmitButtonStateOption state}) {
    return RoofSubmitButton(text: text, onTap: onTap, state: state);
  }
}
