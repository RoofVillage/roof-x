import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'picker_field.dart';
import 'icon_option_select_value.dart';

class FormIconSelectFieldData
    extends PickerFieldData<FormIconOptionSelectValueData> {
  List<FormIconOptionSelectValueData> options;
  FormIconOptionSelectValueData selectedOption;

  FormIconSelectFieldData({
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
