import 'package:flutter/material.dart';
import 'text_field.dart';

class EmailTextFieldData extends FormTextFieldData {
  EmailTextFieldData(
      {String title = "Email",
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
