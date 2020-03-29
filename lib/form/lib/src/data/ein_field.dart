import 'package:flutter/material.dart';
import 'package:form_validation_exception/index.dart';
import 'package:mask/index.dart';

import 'text_field.dart';

class FormEinFieldData extends FormTextFieldData {
  // valid prefixes: https://www.irs.gov/businesses/small-businesses-self-employed/how-eins-are-assigned-and-valid-ein-prefixes
  static final regEx = RegExp(
      r"^([07][1-7]|1[0-6]|2[0-7]|[35][0-9]|[468][0-8]|9[0-589])-?\d{7}$");

  FormEinFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          mask: MaskOption.ein,
          title: 'EIN',
          placeholder: '12-3456789',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.number,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          max: 10,
          exceptionTitle: exceptionTitle,
        );

  @override
  Future<void> validate() async {
    if (!regEx.hasMatch(value)) {
      throw FormValidationException.badEin();
    }
    super.validate();
  }
}
