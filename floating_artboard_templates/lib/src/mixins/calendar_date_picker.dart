import 'package:flutter/material.dart';
import 'package:calendar_date_picker/index.dart';

mixin CalendarArtboard {
  DateTime get selectedDate;
  DateTime get startBound;
  DateTime get endBound;
}

mixin CalendarArtboardState {
  DateTime selectedDate;

  CalendarArtboard get calendarArtboard;

  void setState(dynamic());

  setDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  Widget buildCalendar(BuildContext context) {
    return RoofCalendarDatePicker(
      selectedDate: selectedDate,
      startBound: calendarArtboard.startBound,
      endBound: calendarArtboard.endBound,
      onDayPressed: setDate,
    );
  }
}
