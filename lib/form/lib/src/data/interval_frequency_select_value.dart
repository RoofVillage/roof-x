import 'package:flutter/material.dart';
import 'package:frequency_type/index.dart';

import 'picker_field.dart';

class FormIntervalFrequencySelectValueData extends PickerFieldData<TimeOfDay> {
  int interval;
  FrequencyType frequency;

  FormIntervalFrequencySelectValueData(
      {@required this.interval, @required this.frequency});
}
