import 'package:flutter/material.dart';

import 'picker_field.dart';

class FormTimePickerFieldData extends FormPickerFieldData<TimeOfDay> {
  FormTimePickerFieldData({
    String title,
    TimeOfDay selectedTime,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedTime,
          size: size,
          isVisible: isVisible,
        );
}
