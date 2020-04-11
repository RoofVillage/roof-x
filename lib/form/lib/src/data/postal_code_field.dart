import 'dart:async';

import 'package:flutter/material.dart';

import 'text_field.dart';

class FormPostalCodeFieldData extends FormTextFieldData {
  static const _maxLength = 5;

  FormPostalCodeFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.numberWithOptions(
            decimal: true,
          ),
          size: size,
          isVisible: isVisible,
          exceptionTitle: exceptionTitle,
          min: isRequired == true ? 1 : null,
          max: _maxLength,
        );

  Future<void> validate() async {}
}
