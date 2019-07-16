import 'package:flutter/material.dart';
import 'package:date/index.dart';

import 'picker_field.dart';

class FormDatePickerFieldData extends FormPickerFieldData<Date> {
  DateTime startBound;
  DateTime endBound;

  FormDatePickerFieldData({
    @required String title,
    Date initialValue,
    this.startBound,
    this.endBound,
    Function onTap,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue ?? Date.now(),
          onTap: onTap,
          size: size,
          isVisible: isVisible,
        );
}
