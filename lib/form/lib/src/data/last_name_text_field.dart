import 'package:flutter/material.dart';

import 'text_field.dart';

class FormLastNameTextFieldData extends FormTextFieldData {
  FormLastNameTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: "Last Name",
          placeholder: 'Last',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          exceptionTitle: exceptionTitle,
        );
}
