import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_validation_exception/index.dart';
import 'text_field.dart';

class PasswordFormTextFieldData extends FormTextFieldData {
  static const numberSet = '0123456789';
  static const letterSet =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const symbolSet = r'!@#$%^&*()_+-?><,./|][}{]~';
  static const characterSet =
      r'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-?><,./|][}{]~';

  PasswordFormTextFieldData({
    String title = "Password",
    String placeholder = "8+ letters, numbers & symbols",
    String initialValue,
    double size,
    bool autofocus,
    ValueChanged<String> onSubmitted,
    String exceptionTitle,
  }) : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            autofocus: autofocus,
            size: size,
            min: 8,
            max: 30,
            exceptionTitle: exceptionTitle);

  Future<void> validate() async {
    if (!value.contains(RegExp(numberSet)) ||
        !value.contains(RegExp(letterSet)) ||
        !value.contains(RegExp(symbolSet)) ||
        !value.contains(characterSet)) {
      throw FormValidationException.unsafePassword();
    }
    super.validate();
  }
}
