import 'dart:async';

import 'package:flutter/material.dart';
import 'text_field.dart';

class IntegerFormTextFieldData extends FormTextFieldData {
  IntegerFormTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
    double maxValue,
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
        );

  Future<void> validate() async {}
}
