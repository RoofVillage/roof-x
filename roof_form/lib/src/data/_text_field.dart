import 'package:flutter/material.dart';
import '_composition_field.dart';

class FormTextFieldData extends FormCompositionFieldData {
  FormTextFieldData(
      {String title,
      String placeholder,
      bool autofocus,
      TextInputAction inputAction,
      String initialValue,
      double size,
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
