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
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onChanged: onChanged,
            autofocus: autofocus,
            size: size,
            hidden: hidden);

  @override
  Future<void> validate() async {
    if (value.length > Consts.maxCharsInMediumTextField) {
      throw FormValidationException.longMediumString(title);
    }
  }
}
