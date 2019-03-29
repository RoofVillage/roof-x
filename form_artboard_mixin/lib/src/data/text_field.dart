import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'composition_field.dart';

abstract class FormTextFieldData extends FormCompositionFieldData {
  MaskOption mask;

  FormTextFieldData({
    this.mask,
    @required String title,
    String placeholder,
    String initialValue,
    TextInputType keyboardType,
    double size,
    bool autofocus,
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
}
