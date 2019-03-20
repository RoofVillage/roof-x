import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exceptions/index.dart';

import 'text_field.dart';

class EmailFormTextFieldData extends FormTextFieldData {
  static final regEx = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  EmailFormTextFieldData(
      {String title = "Email",
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

  @override
  Future<void> validate() async {
    if (!regEx.hasMatch(value)) {
      throw FormValidationException.badEmail;
    }
  }
}
