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
      this.inputAction = TextInputAction.none,
      String initialValue,
      int rowSlots,
      int slots,
      bool forceNewRow,
      ValueChanged<String> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            rowSlots: rowSlots,
            slots: slots,
            forceNewRow: forceNewRow,
            hidden: hidden);
}
