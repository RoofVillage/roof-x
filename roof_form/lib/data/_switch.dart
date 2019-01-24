import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormSwitchData extends StreamableFormFieldData<bool> {
  String title;

  FormSwitchData(
      {this.title,
      bool initialValue,
      int rowSlots,
      int slots,
      bool forceNewRow,
      ValueChanged<bool> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            rowSlots: rowSlots,
            slots: slots,
            forceNewRow: forceNewRow,
            hidden: hidden);
}
