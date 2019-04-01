import 'dart:async';

import 'package:flutter/material.dart';
import 'package:exceptions/index.dart';
import 'package:consts/index.dart';

import 'composition_field.dart';

class FormTextAreaData extends FormCompositionFieldData {
  FormTextAreaData({
    @required String title,
    String placeholder,
    String initialValue = "",
    double size = 1,
    bool autofocus,
    TextInputType keyboardType,
    bool isOptional,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autofocus: autofocus,
          size: size,
          isOptional: isOptional,
        );

  Future<void> validate() async {
    if (value.length > Consts.maxCharsInLongTextField) {
      throw FormValidationException.longLongString(title);
    }
  }
}
