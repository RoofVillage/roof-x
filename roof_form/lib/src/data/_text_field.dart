import 'package:flutter/material.dart';
import '_composition_field.dart';

class FormTextFieldData extends FormCompositionFieldData {
  FormTextFieldData(
      {String title,
      String placeholder,
      bool autofocus,
      TextInputAction inputAction,
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
