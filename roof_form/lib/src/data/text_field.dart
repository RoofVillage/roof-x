import 'package:flutter/material.dart';
import '_composition_field.dart';

class FormTextFieldData extends FormCompositionFieldData {
  FormTextFieldData(
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
}
