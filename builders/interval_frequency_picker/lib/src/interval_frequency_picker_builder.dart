import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:period_type/index.dart';
import 'package:haptics/index.dart';
import 'package:frequency/index.dart';
import 'package:labeled_value/index.dart';

import '_components/interval_frequency_picker.dart';

mixin IntervalFrequencyPickerArtboardBuilder
    implements Artboard<Frequency> {
  Frequency get selectedValue;
  List<LabeledValue<int>> get intervalList;
  List<LabeledValue<PeriodType>> get periodList;
}

mixin IntervalFrequencyPickerArtboardBuilderState<
    T extends IntervalFrequencyPickerArtboardBuilder> implements ArtboardState<T> {
  Frequency _selectedSchedule;

  Frequency get selectedSchedule => _selectedSchedule;
  set selectedSchedule(Frequency newValue) => _selectedSchedule = newValue;

  Widget buildIntervalFrequencyPicker(BuildContext context) {
    return IntervalFrequencyPicker(
      selectedValue: widget.selectedValue,
      intervalList: widget.intervalList,
      periodList: widget.periodList,
      onChanged: _onChanged,
    );
  }

  void _onChanged(Frequency newValue) {
    triggerHapticWith(HapticOption.click);
    selectedSchedule = newValue;
  }
}
