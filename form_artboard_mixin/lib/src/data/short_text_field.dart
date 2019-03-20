import 'dart:async';

import 'package:flutter/material.dart';
import 'package:consts/index.dart';
import 'package:exceptions/index.dart';
import 'text_field.dart';

class ShortFormTextFieldData extends FormTextFieldData {
  ShortFormTextFieldData(
      {String title,
      String placeholder,
      String initialValue,
      double size,
      bool autofocus,
      bool canSubmitWithKeyboardRaised,
      ValueChanged<String> onSubmitted,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool hidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            autofocus: autofocus,
            canSubmitWithKeyboardRaised: canSubmitWithKeyboardRaised,
            size: size,
            hidden: hidden);

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInSmallTextField) {
      throw FormValidationException.longSmallString(title);
    }
  }
}
