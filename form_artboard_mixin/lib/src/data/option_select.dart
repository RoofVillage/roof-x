import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'option_select_value.dart';

class FormOptionSelectData
    extends StreamableFormFieldData<List<FormOptionSelectValueData>> {
  String title;
  String emptyText;
  List<FormOptionSelectValueData> options;
  bool isMultiSelect;

  FormOptionSelectData(
      {this.title,
      this.emptyText = "Nothing selected",
      this.options,
      this.isMultiSelect,
      List<FormOptionSelectValueData> initialValue,
      double size,
      ValueChanged<List<FormOptionSelectValueData>> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
