import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exceptions/index.dart';
import 'package:consts/index.dart';

import 'composition_field.dart';

class FormTextAreaData extends FormCompositionFieldData {
  FormTextAreaData(
      {String title,
      String placeholder,
      String initialValue = "",
      double size = 1,
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
    if (value.length > Consts.maxCharsInLongTextField) {
      throw FormValidationException.longLongString(title);
    }
  }
}
