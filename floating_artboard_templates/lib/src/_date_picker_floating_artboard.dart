import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:date_picker_artboard_mixin/index.dart';
import 'package:date/index.dart';

import 'mixins/index.dart';
import '_floating_artboard_panel.dart';

class DatePickerFloatingArtboard extends FloatingArtboard<Date>
    with DatePickerArtboard {
  final Date selectedDate;
  final Date startBound;
  final Date endBound;

  DatePickerFloatingArtboard({
    this.selectedDate,
    this.startBound,
    this.endBound,
  });

  _DatePickerFloatingArtboardState createState() =>
      _DatePickerFloatingArtboardState();
}

class _DatePickerFloatingArtboardState extends State<DatePickerFloatingArtboard>
    with FloatingArtboardState, DatePickerArtboardState {
  @override
  get datePickerArtboard => widget;

  @override
  Date get date => FloatingArtboardNavigatorPanel.of(context).result;

  @override
  set date(Date newDate) {
    FloatingArtboardNavigatorPanel.of(context).result = newDate;
  }

  @override
  List<Widget> buildChildren(BuildContext context) => [buildCalendar(context)];
}
