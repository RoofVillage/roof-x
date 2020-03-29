import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';

import 'text_field.dart';

class FormShortSsnFieldData extends FormTextFieldData {
  static const _maxLength = 4;

  FormShortSsnFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: 'SSN (last 4)',
          mask: MaskOption.shortSsn,
          placeholder: '0123',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.number,
          size: size,
          isVisible: isVisible,
          exceptionTitle: exceptionTitle,
          min: isRequired == true ? 1 : null,
          max: _maxLength,
        );

  Future<void> validate() async {}
}
