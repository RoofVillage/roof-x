import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:frequency_type/index.dart';
import 'package:haptics/index.dart';
import 'package:interval_frequency_schedule_data/index.dart';
import 'package:titled_option_data/index.dart';

import '_components/interval_frequency_picker.dart';

mixin IntervalFrequencyPickerArtboardBuilder
    implements Artboard<IntervalFrequencyScheduleData> {
  IntervalFrequencyScheduleData get selectedValue;
  List<TitledOptionData<int>> get intervalList;
  List<TitledOptionData<FrequencyType>> get frequencyList;
}

mixin IntervalFrequencyPickerArtboardBuilderState<
    T extends IntervalFrequencyPickerArtboardBuilder> implements ArtboardState<T> {
  IntervalFrequencyScheduleData _selectedSchedule;

  IntervalFrequencyScheduleData get selectedSchedule => _selectedSchedule;
  set selectedSchedule(IntervalFrequencyScheduleData newValue) => _selectedSchedule = newValue;

  Widget buildIntervalFrequencyPicker(BuildContext context) {
    return IntervalFrequencyPicker(
      selectedValue: widget.selectedValue,
      intervalList: widget.intervalList,
      frequencyList: widget.frequencyList,
      onChanged: _onChanged,
    );
  }

  void _onChanged(IntervalFrequencyScheduleData newValue) {
    triggerHapticWith(HapticOption.click);
    selectedSchedule = newValue;
  }
}
