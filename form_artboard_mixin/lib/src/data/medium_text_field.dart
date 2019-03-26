import 'dart:async';

import 'package:flutter/material.dart';
import 'package:consts/index.dart';
import 'package:exceptions/index.dart';
import 'text_field.dart';

class MediumFormTextFieldData extends FormTextFieldData {
  MediumFormTextFieldData(
      {String title,
      String placeholder,
      String initialValue,
      double size,
      bool autofocus,
      ValueChanged<String> onSubmitted,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool isHidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            autofocus: autofocus,
            size: size,
            isHidden: isHidden);

  @override
  Future<void> validate() async {
    if (value.length > Consts.maxCharsInMediumTextField) {
      throw FormValidationException.longMediumString(title);
    }
  }
}
