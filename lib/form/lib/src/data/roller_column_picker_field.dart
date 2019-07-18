import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';

import 'picker_field.dart';

class FormRollerColumnPickerFieldData<T> extends FormPickerFieldData<LabeledValue<T>> {
  List<LabeledValue<T>> buildOptions() => null;
  bool canRollover = false;

  FormRollerColumnPickerFieldData({
    String title,
    @required LabeledValue<T> selectedValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedValue,
          size: size,
          isVisible: isVisible,
        );
}
