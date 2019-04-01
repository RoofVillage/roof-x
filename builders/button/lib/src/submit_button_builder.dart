import 'package:flutter/material.dart';

import 'components/index.dart';
import 'components/mixins/index.dart';

export 'components/submit.dart' show SubmitButtonStateOption;

mixin SubmitButtonBuilder {
  RoofSubmitButton buildSubmitButton(BuildContext context,
      {@required String text,
      @required OnTap onTap,
      SubmitButtonStateOption state}) {
    return RoofSubmitButton(text: text, onTap: onTap, state: state);
  }
}
