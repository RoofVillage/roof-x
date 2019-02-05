import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class FormCompositionFieldData extends StreamableFormFieldData<String> {
  String title;
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;

  FormCompositionFieldData(
      {this.title,
      this.placeholder,
      this.inputAction,
      bool autofocus,
      String initialValue,
      double size,
      ValueChanged<String> onChanged,
      bool hidden}) 
      : autofocus = autofocus ?? false, 
      super(
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
