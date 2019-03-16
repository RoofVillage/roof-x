import 'package:flutter/material.dart';
// import 'package:consts/index.dart';
// import 'package:error_messages/index.dart';
import 'text_field.dart';

class ShortFormTextFieldData extends FormTextFieldData {
  ShortFormTextFieldData(
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

  Future<void> validate() async {
    // if (value.length > Consts.maxCharsInSmallTextField) {
    //   throw AssertionError(ValidationErrors.longSmallString(title));
    // }
  }
}
