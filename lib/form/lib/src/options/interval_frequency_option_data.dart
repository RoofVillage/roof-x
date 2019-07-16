import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:period_type/index.dart';

class FormIntervalFrequencyOptionData extends StreamableData {
  int interval;
  PeriodType frequency;

  FormIntervalFrequencyOptionData(
      {@required this.interval, @required this.frequency});
}
