import 'package:flutter/material.dart';
// import 'package:mask/index.dart';
import 'text_field.dart';

class PhoneNumberFormTextFieldData extends FormTextFieldData {
  PhoneNumberFormTextFieldData(
      {String title = "Phone number",
      String placeholder,
      String initialValue,
      double size,
      bool autofocus,
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            // mask: MaskOption.phoneNumber,
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onChanged: onChanged,
            autofocus: autofocus,
            size: size,
            hidden: hidden);

  Future<void> validate() async {
    ///call Roof API to validate phone number;
  }
}
