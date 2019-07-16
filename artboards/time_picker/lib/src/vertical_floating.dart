import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:time_picker_builder/index.dart';

class TimePickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<TimeOfDay> with TimePickerArtboardBuilder {
  final TimeOfDay initialValue;

  TimePickerVerticalFloatingArtboard({this.initialValue});

  _TimePickerVerticalFloatingArtboardState createState() =>
      _TimePickerVerticalFloatingArtboardState();
}

class _TimePickerVerticalFloatingArtboardState
    extends State<TimePickerVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<TimePickerVerticalFloatingArtboard>,
        TimePickerArtboardBuilderState<TimePickerVerticalFloatingArtboard> {
  @override
  TimeOfDay get selectedTime =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedTime(TimeOfDay newSelectedTime) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newSelectedTime;
  }

  @override
  Widget buildBody(BuildContext context) => buildTimePicker(context);
}
