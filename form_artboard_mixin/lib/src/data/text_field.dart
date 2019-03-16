import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import '_composition_field.dart';

abstract class FormTextFieldData extends FormCompositionFieldData {
  MaskOption mask;

  FormTextFieldData(
      {this.mask,
      String title,
      String placeholder,
      String initialValue = "",
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
}
