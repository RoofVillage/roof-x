import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormSwitchData extends StreamableFormFieldData<bool> {
  String title;

  FormSwitchData(
      {this.title,
      bool initialValue,
      double size,
      ValueChanged<bool> onChanged,
      bool hidden})
      : super(
            initialValue: initialValue,
            onChanged: onChanged,
            size: size,
            hidden: hidden);
}
