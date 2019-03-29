import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';

import 'mixins/index.dart';

class DatePickerFloatingArtboard extends FloatingArtboard with CalendarArtboard {
  final DateTime selectedDate;
  final DateTime startBound;
  final DateTime endBound;

  DatePickerFloatingArtboard({
    this.selectedDate,
    this.startBound,
    this.endBound,
  });

  _DatePickerFloatingArtboardState createState() =>
      _DatePickerFloatingArtboardState();
}

class _DatePickerFloatingArtboardState extends State<DatePickerFloatingArtboard>
    with FloatingArtboardState, CalendarArtboardState {
  get calendarArtboard => widget;

  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  @override
  List<Widget> buildChildren(BuildContext context) {
    final calendarPicker = buildCalendar(context);

    return [calendarPicker];
  }
}
