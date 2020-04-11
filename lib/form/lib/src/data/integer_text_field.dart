import 'dart:async';

import 'package:flutter/material.dart';

import 'text_field.dart';

class FormIntegerTextFieldData extends FormTextFieldData {
  FormIntegerTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool isRequired,
    bool autofocus,
    String exceptionTitle,
    double min,
    double max,
    double maxValue,
    bool isVisible,
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
          maxValue: maxValue,
          min: isRequired == true ? 1 : null,
        );

  Future<void> validate() async {}
}
