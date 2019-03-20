import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:exceptions/index.dart';
import 'text_field.dart';

class PhoneNumberFormTextFieldData extends FormTextFieldData {
  PhoneNumberFormTextFieldData(
      {String title = "Phone number",
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
            mask: MaskOption.phoneNumber,
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
    if (value.length < 5) {
      throw FormValidationException.badPhoneNumber;
    }
    // /call Roof API to validate phone number;
  }
}
