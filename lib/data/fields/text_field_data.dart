import 'package:flutter/material.dart';

import './field_data.dart';

class TextFieldData extends FieldData {
  static const _DEFAULT_MAX_FIELD_LENGTH = 70;

  final int minLength;
  final int maxLength;
  final TextInputAction textInputAction;

  TextFieldData(
      {this.minLength = 0,
      this.maxLength = _DEFAULT_MAX_FIELD_LENGTH,
      this.textInputAction,
      name = "Password",
      placeholder = "password",
      initialValue,
      autofocus,
      keyboardType})
      : super(
            name: name,
            placeholder: placeholder,
            initialValue: initialValue,
            autofocus: autofocus,
            keyboardType: keyboardType);
}
