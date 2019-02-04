import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'option_select_value.dart';

class FormOptionSelectData
    extends StreamableFormFieldData<FormOptionSelectValueData> {
  String title;
  String emptyText;
  List<FormOptionSelectValueData> selectedOption;
  List<FormOptionSelectValueData> options;
  bool isMultiSelect;

  FormOptionSelectData(
      {this.title,
      this.emptyText,
      this.options,
      this.isMultiSelect,
      FormOptionSelectValueData initialValue,
      double size,
      ValueChanged<FormOptionSelectValueData> onChanged,
      bool hidden})
      : super(
            title: title,
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
