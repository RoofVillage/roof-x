import 'package:flutter/material.dart';
import 'package:form/src/data/field.dart';

import '_mixins/on_tap_listener_adder.dart';

class FormTimePickerFieldData extends StreamableFormFieldData<TimeOfDay> with OnTapListenerAdder {
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
