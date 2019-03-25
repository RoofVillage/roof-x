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
      this.isMultiSelect = false,
      List<FormOptionSelectValueData> initialValue,
      double size,
      ValueChanged<List<FormOptionSelectValueData>> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool isHidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            size: size,
            isHidden: isHidden);
}
