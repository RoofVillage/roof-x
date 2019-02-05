import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormCompositionFieldData extends StreamableFormFieldData<String> {
  final String title;
  final String placeholder;
  final bool autofocus;
  final TextInputAction inputAction;

  FormCompositionFieldData(
      {this.title,
      this.placeholder,
      this.autofocus = false,
      this.inputAction,
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
