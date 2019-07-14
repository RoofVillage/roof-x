import 'package:flutter/material.dart';
import 'package:option_picker_data/index.dart';
import 'picker_field.dart';

class FormRollerColumnPickerFieldData<T> extends PickerFieldData<OptionPickerData<T>> {
  List<OptionPickerData<T>> buildOptions() => null;

  FormRollerColumnPickerFieldData({
    String title,
    @required OptionPickerData<T> selectedValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedValue,
          size: size,
          isVisible: isVisible,
        );
}
