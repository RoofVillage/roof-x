import 'dart:async';

import 'package:flutter/material.dart';
import 'package:consts/index.dart';
import 'package:error_messages/index.dart';
import 'text_field.dart';

class PasswordFormTextFieldData extends FormTextFieldData {
  static const numberSet = '0123456789';
  static const letterSet =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const symbolSet = r'!@#$%^&*()_+-?><,./|][}{]~';
  static const characterSet =
      r'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-?><,./|][}{]~';

  PasswordFormTextFieldData(
      {String title = "Password",
      String placeholder = "8+ letters, numbers & symbols",
      String initialValue,
      double size,
      bool autofocus,
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onChanged: onChanged,
            autofocus: autofocus,
            size: size,
            hidden: hidden);

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInPassword) {
      throw AssertionError(ValidationErrors.longPassword);
    }
    if (value.length < Consts.minCharsInPassword) {
      throw AssertionError(ValidationErrors.shortPassword);
    }
    if (!value.contains(RegExp(numberSet)) ||
        !value.contains(RegExp(letterSet)) ||
        !value.contains(RegExp(symbolSet)) ||
        !value.contains(characterSet)) {
      throw AssertionError(ValidationErrors.unsafePassword);
    }
  }
}
