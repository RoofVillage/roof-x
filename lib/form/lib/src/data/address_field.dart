import 'package:flutter/material.dart';

import 'text_field.dart';

class FormAddressTextFieldData extends FormTextFieldData {
  FormAddressTextFieldData({
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    String exceptionTitle,
  }) : super(
          title: 'Address',
          placeholder: '2760 Utah St.',
          initialValue: initialValue,
          autofocus: autofocus,
          keyboardType: TextInputType.text,
          size: size,
          isVisible: isVisible,
          min: isRequired == true ? 1 : null,
          exceptionTitle: exceptionTitle,
        );
}
