import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormCompositionFieldData extends StreamableFormFieldData<String> {
  String title;
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;

  FormCompositionFieldData(
      {this.title,
      this.placeholder,
      this.autofocus = false,
      this.inputAction,
      String initialValue,
      int rowSlots,
      int slots,
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            rowSlots: rowSlots,
            slots: slots,
            hidden: hidden);
}
