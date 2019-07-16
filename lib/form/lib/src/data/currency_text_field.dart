import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';

import 'text_field.dart';

class FormCurrencyTextFieldData extends FormTextFieldData {
  FormCurrencyTextFieldData({
    String title = "Amount",
    String placeholder = "0.00",
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          mask: MaskOption.money,
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
        );

  Future<void> validate() async {}
}
