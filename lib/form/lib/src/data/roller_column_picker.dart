import 'package:flutter/material.dart';
import 'package:titled_option_data/index.dart';
import 'picker_field.dart';

class FormRollerColumnPickerFieldData<T> extends PickerFieldData<TitledOptionData<T>> {
  List<TitledOptionData<T>> buildOptions() => null;

  FormRollerColumnPickerFieldData({
    String title,
    @required TitledOptionData<T> selectedValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedValue,
          size: size,
          isVisible: isVisible,
        );
}
