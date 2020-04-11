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
    Function onInvalid,
    double size,
    bool isRemovable,
    bool isVisible,
    bool autofocus,
    bool isOptional,
    int max,
    int min,
    double maxValue,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          keyboardType: keyboardType,
          autofocus: autofocus,
          size: size,
          isRemovable: isRemovable,
          isVisible: isVisible,
          isOptional: isOptional,
          max: max,
          min: min,
          maxValue: maxValue,
          exceptionTitle: exceptionTitle,
        );
}
