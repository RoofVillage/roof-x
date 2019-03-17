import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exceptions/index.dart';
import 'package:consts/index.dart';

import '_composition_field.dart';

class FormTextAreaData extends FormCompositionFieldData {
  FormTextAreaData(
      {String title,
      String placeholder,
      String initialValue = "",
      double size = 1,
      bool autofocus = false,
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

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInLongTextField) {
      throw FormValidationException.longLongString(title);
    }
  }
}
