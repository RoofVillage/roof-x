import 'package:flutter/material.dart';
import 'package:frequency_type/index.dart';

import 'picker_field.dart';

class FormIntervalFrequencyOptionData extends PickerFieldData<TimeOfDay> {
  int interval;
  FrequencyType frequency;

  FormIntervalFrequencyOptionData(
      {@required this.interval, @required this.frequency});
}
