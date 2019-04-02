import 'package:flutter/material.dart';

import '_components/submit.dart';

export '_components/submit.dart' show SubmitButtonStateOption;

mixin SubmitButtonBuilder {
  RoofSubmitButton buildSubmitButton(BuildContext context,
      {@required String text,
      @required OnTap onTap,
      SubmitButtonStateOption state}) {
    return RoofSubmitButton(text: text, onTap: onTap, state: state);
  }
}
