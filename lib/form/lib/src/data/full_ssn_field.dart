import 'package:flutter/material.dart';
import 'package:form_validation_exception/index.dart';
import 'package:mask/index.dart';

import 'text_field.dart';

class FormFullSsnFieldData extends FormTextFieldData {
  static final regEx =
      RegExp(r"^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!0000)[0-9]{4}$");

  FormFullSsnFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          mask: MaskOption.ssn,
          title: 'SSN',
          placeholder: '123-45-6789',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.number,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          max: 11,
          exceptionTitle: exceptionTitle,
        );

  @override
  Future<void> validate() async {
    if (!regEx.hasMatch(value)) {
      throw FormValidationException.badSsn();
    }
    super.validate();
  }
}
