import 'package:flutter/material.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';

import 'components/index.dart';

mixin DatePickerBuilder {
  Date get selectedDate;
  Date get startBound;
  Date get endBound;
}

mixin DatePickerBuilderState {
  DatePickerBuilder get datePickerArtboard;

  Date _date;

  Date get date => _date;
  set date(Date newDate) => _date = newDate;

  void setState(dynamic());

  Widget buildDatePicker(BuildContext context) {
    return RoofCalendarDatePicker(
      selectedDate: date ?? datePickerArtboard.selectedDate,
      startBound: datePickerArtboard.startBound,
      endBound: datePickerArtboard.endBound,
      onDayPressed: _onDayPressed,
    );
  }

  void _onDayPressed(Date newDate) {
    triggerHapticWith(HapticOption.click);
    date = newDate;
  }
}
