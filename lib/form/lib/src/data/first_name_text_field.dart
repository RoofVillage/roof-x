import 'package:flutter/material.dart';

import 'text_field.dart';

class FormFirstNameTextFieldData extends FormTextFieldData {
  FormFirstNameTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: "First Name",
          placeholder: 'First',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          exceptionTitle: exceptionTitle,
        );
}
