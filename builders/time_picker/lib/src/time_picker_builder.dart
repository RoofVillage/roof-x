import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';

import '_components/time_picker.dart';

mixin TimePickerArtboardBuilder implements Artboard<TimeOfDay> {
  TimeOfDay get initialValue;
}

mixin TimePickerArtboardBuilderState<T extends TimePickerArtboardBuilder>
    implements ArtboardState<T> {
  TimeOfDay _selectedTime;

  TimeOfDay get selectedTime => _selectedTime;
  set selectedTime(TimeOfDay newTime) => _selectedTime = newTime;

  Widget buildTimePicker(BuildContext context) {
    return TimePicker(
      initialValue: widget.initialValue,
      onChanged: _onChanged,
    );
  }

  void _onChanged(TimeOfDay newTime) {
    triggerHapticWith(HapticOption.click);
    selectedTime = newTime;
  }
}
