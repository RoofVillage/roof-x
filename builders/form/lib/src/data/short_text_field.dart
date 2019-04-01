import 'dart:async';

import 'package:flutter/material.dart';
import 'package:consts/index.dart';
import 'package:exceptions/index.dart';
import 'text_field.dart';

class ShortFormTextFieldData extends FormTextFieldData {
  ShortFormTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool autofocus,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          size: size,
        );

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInSmallTextField) {
      throw FormValidationException.longSmallString(title);
    }
  }
}
