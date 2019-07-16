import 'package:flutter/material.dart';
import 'package:titled_value/index.dart';

import 'picker_field.dart';

class FormRollerColumnPickerFieldData<T> extends FormPickerFieldData<TitledValue<T>> {
  List<TitledValue<T>> buildOptions() => null;
  bool canRollover = false;

  FormRollerColumnPickerFieldData({
    String title,
    @required TitledValue<T> selectedValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedValue,
          size: size,
          isVisible: isVisible,
        );
}
