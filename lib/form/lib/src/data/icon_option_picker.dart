import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'picker_field.dart';
import 'icon_option_picker_data.dart';

class FormIconPickerFieldData
    extends PickerFieldData<FormIconPickerData> {
  List<FormIconPickerData> options;
  FormIconPickerData selectedOption;

  FormIconPickerFieldData({
    this.selectedOption,
    this.options,
    @required String title,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedOption,
          size: size,
          isVisible: isVisible,
        );
}
