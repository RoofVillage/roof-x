import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:interval_frequency_option_data/index.dart';

import '_components/interval_frequency_picker.dart';

mixin IntervalFrequencyPickerBuilder implements Artboard<IntervalFrequencyOptionData> {
  IntervalFrequencyOptionData get initialValue;
}

mixin IntervalFrequencyPickerBuilderState<T extends IntervalFrequencyPickerBuilder>
    implements ArtboardState<T> {
  IntervalFrequencyOptionData _selectedSchedule;

  IntervalFrequencyOptionData get selectedSchedule => _selectedSchedule;
  set selectedSchedule(IntervalFrequencyOptionData newSchedule) => _selectedSchedule = newSchedule;

  Widget buildIntervalFrequencyPicker(BuildContext context) {
    return IntervalFrequencyPicker(
      initialValue: widget.initialValue,
      onChanged: _onChanged,
    );
  }

  void _onChanged(IntervalFrequencyOptionData newSchedule) {
    triggerHapticWith(HapticOption.click);
    selectedSchedule = newSchedule;
  }
}
