import 'package:flutter/material.dart';

import 'composition_field.dart';

class FormTextAreaData extends FormCompositionFieldData {
  FormTextAreaData(
      {@required String title,
      String placeholder,
      String initialValue,
      double size,
      bool isVisible,
      bool autofocus,
      TextInputType keyboardType,
      bool isOptional,
      int max = 750,
      int min,
      String exceptionTitle})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            keyboardType: keyboardType,
            autofocus: autofocus,
            size: size,
            isVisible: isVisible,
            isOptional: isOptional,
            max: max,
            min: min,
            exceptionTitle: exceptionTitle);
}
