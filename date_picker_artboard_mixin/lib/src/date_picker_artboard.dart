import 'package:flutter/material.dart';
import 'package:date/index.dart';
import 'package:calendar_date_picker/index.dart';
import 'package:haptics/index.dart';

mixin DatePickerArtboard {
  Date get selectedDate;
  Date get startBound;
  Date get endBound;
}

mixin DatePickerArtboardState {
  DatePickerArtboard get datePickerArtboard;

  Date _date;

  Date get date => _date;
  set date(Date newDate) => _date = newDate;

  void setState(dynamic());

  Widget buildCalendar(BuildContext context) {
    return RoofCalendarDatePicker(
      selectedDate: date ?? datePickerArtboard.selectedDate,
      startBound: datePickerArtboard.startBound,
      endBound: datePickerArtboard.endBound,
      onDayPressed: _onDayPressed,
    );
  }

  void _onDayPressed(Date newDate) {
    Haptic().triggerWith(HapticOption.click);
    date = newDate;
  }
}
