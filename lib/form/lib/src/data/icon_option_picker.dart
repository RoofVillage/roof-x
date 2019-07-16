import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'picker_field.dart';
import '../options/icon_option_data.dart';

class FormIconPickerFieldData
    extends PickerFieldData<FormIconOptionData> {
  List<FormIconOptionData> options;
  FormIconOptionData selectedOption;

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
