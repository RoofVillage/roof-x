import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exceptions/index.dart';
import 'package:consts/index.dart';

import 'composition_field.dart';

class FormTextAreaData extends FormCompositionFieldData {
  FormTextAreaData(
      {String title,
      String placeholder,
      String initialValue = "",
      double size = 1,
      bool autofocus,
      ValueChanged<String> onSubmitted,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      TextInputType keyboardType,
      bool isOptional,
      bool isHidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            keyboardType: keyboardType,
            autofocus: autofocus,
            size: size,
            isOptional: isOptional,
            isHidden: isHidden);

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInLongTextField) {
      throw FormValidationException.longLongString(title);
    }
  }
}
