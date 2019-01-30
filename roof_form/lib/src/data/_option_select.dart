import 'package:flutter/material.dart';
import 'package:form/index.dart';

import '_option_select_value.dart';

class FormOptionSelectData
    extends StreamableFormFieldData<FormOptionSelectValueData> {
  List<FormOptionSelectValueData> values;

  FormOptionSelectData(
      {this.values,
      FormOptionSelectValueData initialValue,
      int rowSlots,
      int slots,
      ValueChanged<FormOptionSelectValueData> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            rowSlots: rowSlots,
            slots: slots,
            hidden: hidden);
}
