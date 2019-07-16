import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_validation_exception/index.dart';

import 'text_field.dart';

class FormEmailTextFieldData extends FormTextFieldData {
  static final regEx = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  FormEmailTextFieldData({
    String title = "Email",
    String placeholder,
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.emailAddress,
          size: size,
          isVisible: isVisible,
          exceptionTitle: exceptionTitle,
        );

  @override
  Future<void> validate() async {
    if (!regEx.hasMatch(value)) {
      throw FormValidationException.badEmail();
    }
    super.validate();
  }
}
