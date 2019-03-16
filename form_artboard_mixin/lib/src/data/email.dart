import 'package:flutter/material.dart';
// import 'package:error_messages/index.dart';

import 'text_field.dart';

class EmailFormTextFieldData extends FormTextFieldData {
  static const _validPattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  EmailFormTextFieldData(
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

  @override
  Future<void> validate() async {
    // final regEx = RegExp(_validPattern);
    // if (!regEx.hasMatch(value)) throw AssertionError(ValidationErrors.badEmail);
  }
}
