import 'package:flutter/material.dart';
import 'text_field.dart';

class PasswordTextFieldData extends FormTextFieldData {
  PasswordTextFieldData(
      {String title = "Password",
      String placeholder = "8+ letters, numbers & symbols",
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
