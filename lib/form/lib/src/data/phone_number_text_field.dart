import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:form_validation_exception/index.dart';

import 'text_field.dart';

class FormPhoneNumberTextFieldData extends FormTextFieldData {
  FormPhoneNumberTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          mask: MaskOption.phoneNumber,
          title: 'Phone number',
          placeholder: '(123) 456-7890',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.phone,
          size: size,
          isVisible: isVisible,
          exceptionTitle: exceptionTitle,
        );

  Future<void> validate() async {
    if (value.length < 5) {
      throw FormValidationException.badPhoneNumber();
    }
    // /call Roof API to validate phone number;
  }
}
