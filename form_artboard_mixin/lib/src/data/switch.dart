import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormSwitchData extends StreamableFormFieldData<bool> {
  String title;
  bool initialValue;

  FormSwitchData(
      {this.title,
      this.initialValue,
      double size,
      ValueChanged<bool> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool hidden})
      : super(
            title: title,
            initialValue: initialValue,
            size: size,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            hidden: hidden);
}
