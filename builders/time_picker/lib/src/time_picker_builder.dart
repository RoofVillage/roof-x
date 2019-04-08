import 'package:flutter/material.dart';

import '_components/time_picker.dart';

mixin TimePickerBuilder {
  TimeOfDay get initialValue => TimeOfDay.now();

  RoofTimePicker buildTimePicker(BuildContext context) {
    return RoofTimePicker(
      initialValue: initialValue,
    );
  }
}
