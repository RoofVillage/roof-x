import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:date_picker_builder/index.dart';
import 'package:date/index.dart';
import 'package:artboard/index.dart';

class DatePickerFloatingArtboard extends StatefulWidget
    with FloatingArtboard<Date>, Artboard<Date>, DatePickerBuilder {
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
    with
        ArtboardState<DatePickerFloatingArtboard>,
        FloatingArtboardState<DatePickerFloatingArtboard>,
        DatePickerBuilderState<DatePickerFloatingArtboard> {
  @override
  Date get date =>
      FloatingArtboardNavigatorPanel.of(context, shouldRebuild: false).result;

  @override
  set date(Date newDate) {
    FloatingArtboardNavigatorPanel.of(context).result = newDate;
  }

  @override
  List<Widget> buildChildren(BuildContext context) {
    return [buildDatePicker(context)];
  }
}
