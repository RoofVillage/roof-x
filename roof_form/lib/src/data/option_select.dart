import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'option_select_value.dart';

class FormOptionSelectData
    extends StreamableFormFieldData<FormOptionSelectValueData> {
  List<FormOptionSelectValueData> values;

  FormOptionSelectData(
      {this.values,
      FormOptionSelectValueData initialValue,
      double size,
      ValueChanged<FormOptionSelectValueData> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
