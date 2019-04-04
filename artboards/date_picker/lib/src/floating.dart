import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';

class DatePickerFloatingArtboard extends FloatingArtboard<Date>
    with DatePickerBuilder {
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

class _DatePickerFloatingArtboardState
    extends FloatingArtboardState<DatePickerFloatingArtboard>
    with DatePickerBuilderState<DatePickerFloatingArtboard> {
  @override
  Date get date =>
      FloatingArtboardNavigatorPanel.of(context, shouldRebuild: false).result;

  @override
  set date(Date newDate) {
    FloatingArtboardNavigatorPanel.of(context).result = newDate;
  }

  @override
  Widget buildBody(BuildContext context) => buildDatePicker(context);
}
