import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'picker_field.dart';
import '../options/labeled_icon.dart';

class FormIconPickerFieldData
    extends FormPickerFieldData<FormLabeledIcon> {
  List<FormLabeledIcon> options;
  FormLabeledIcon selectedOption;

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
