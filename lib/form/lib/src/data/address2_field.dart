import 'package:flutter/material.dart';

import 'text_field.dart';

class FormAddress2TextFieldData extends FormTextFieldData {
  FormAddress2TextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          title: 'Address 2',
          placeholder: 'Apt. B',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          size: size,
          isVisible: isVisible,
          exceptionTitle: exceptionTitle,
        );
}
