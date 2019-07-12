import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:interval_frequency_picker_data/index.dart';

import '_components/interval_frequency_picker.dart';

mixin IntervalFrequencyPickerBuilder implements Artboard<IntervalFrequencyPickerData> {
  IntervalFrequencyPickerData get initialValue;
}

mixin IntervalFrequencyPickerBuilderState<T extends IntervalFrequencyPickerBuilder>
    implements ArtboardState<T> {
  IntervalFrequencyPickerData _selectedSchedule;

  IntervalFrequencyPickerData get selectedSchedule => _selectedSchedule;
  set selectedSchedule(IntervalFrequencyPickerData newSchedule) => _selectedSchedule = newSchedule;

  Widget buildIntervalFrequencyPicker(BuildContext context) {
    return IntervalFrequencyPicker(
      initialValue: widget.initialValue,
      onChanged: _onChanged,
    );
  }

  void _onChanged(IntervalFrequencyPickerData newSchedule) {
    triggerHapticWith(HapticOption.click);
    selectedSchedule = newSchedule;
  }
}
