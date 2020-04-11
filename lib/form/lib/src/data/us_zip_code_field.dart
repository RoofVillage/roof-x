import 'package:flutter/material.dart';

import 'text_field.dart';

class FormUsZipCodeTextFieldData extends FormTextFieldData {
  FormUsZipCodeTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: "Zip Code",
          placeholder: '01234',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.number,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 5 : null,
          max: 5,
          exceptionTitle: exceptionTitle,
        );
}
