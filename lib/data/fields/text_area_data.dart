import 'package:flutter/material.dart';

import './field_data.dart';

class TextAreaData extends FieldData {
  static const _DEFAULT_MAX_FIELD_LENGTH = 1000;

  final int minLength;
  final int maxLength;
  TextInputAction textInputAction;
  TextInputType textInputType;

  TextAreaData(
      {name,
      placeholder,
      initialValue,
      autofocus,
      keyboardType,
      this.minLength = 0,
      this.maxLength = _DEFAULT_MAX_FIELD_LENGTH,
      this.textInputAction,
      this.textInputType = TextInputType.text})
      : super(
            name: name,
            placeholder: placeholder,
            initialValue: initialValue,
            autofocus: autofocus,
            keyboardType: keyboardType);
}
