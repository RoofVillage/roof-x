import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:form_validation_exception/index.dart';

import 'text_field.dart';

class PhoneNumberFormTextFieldData extends FormTextFieldData {
  PhoneNumberFormTextFieldData(
      {String title = "Phone number",
      String placeholder,
      String initialValue,
      double size,
      bool autofocus,
      String exceptionTitle})
      : super(
            mask: MaskOption.phoneNumber,
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            autofocus: autofocus,
            keyboardType: TextInputType.phone,
            size: size,
            exceptionTitle: exceptionTitle);

  Future<void> validate() async {
    if (value.length < 5) {
      throw FormValidationException.badPhoneNumber();
    }
    // /call Roof API to validate phone number;
  }
}
