import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';

class DatePickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<Date> with DatePickerBuilder {
  final Date selectedDate;
  final Date startBound;
  final Date endBound;

  DatePickerVerticalFloatingArtboard({
    this.selectedDate,
    this.startBound,
    this.endBound,
  });

  _DatePickerVerticalFloatingArtboardState createState() =>
      _DatePickerVerticalFloatingArtboardState();
}

class _DatePickerVerticalFloatingArtboardState
    extends State<DatePickerVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<DatePickerVerticalFloatingArtboard>,
        DatePickerBuilderState<DatePickerVerticalFloatingArtboard> {
  @override
  Date get date =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set date(Date newDate) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newDate;
  }

  @override
  Widget buildBody(BuildContext context) => buildDatePicker(context);
}
