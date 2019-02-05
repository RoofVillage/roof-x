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
      bool hidden})
      : super(
            title: title,
            initialValue: initialValue,
            size: size,
            onChanged: onChanged,
            hidden: hidden);
}
