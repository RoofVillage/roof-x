import 'package:flutter/material.dart';

import 'text_field.dart';

class FormCityTextFieldData extends FormTextFieldData {
  FormCityTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: "City",
          placeholder: 'Raleigh',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          exceptionTitle: exceptionTitle,
        );
}
