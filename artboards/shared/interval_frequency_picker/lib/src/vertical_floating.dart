import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:interval_frequency_picker_data/index.dart';

class IntervalFrequencyPickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<IntervalFrequencyPickerData>
    with IntervalFrequencyPickerBuilder {
  final IntervalFrequencyPickerData initialValue;

  IntervalFrequencyPickerVerticalFloatingArtboard({this.initialValue});

  _IntervalFrequencyPickerVerticalFloatingArtboardState createState() =>
      _IntervalFrequencyPickerVerticalFloatingArtboardState();
}

class _IntervalFrequencyPickerVerticalFloatingArtboardState
    extends State<IntervalFrequencyPickerVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<
            IntervalFrequencyPickerVerticalFloatingArtboard>,
        IntervalFrequencyPickerBuilderState<
            IntervalFrequencyPickerVerticalFloatingArtboard> {
  @override
  IntervalFrequencyPickerData get selectedSchedule =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedSchedule(IntervalFrequencyPickerData newSelectedTime) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newSelectedTime;
  }

  @override
  Widget buildBody(BuildContext context) =>
      buildIntervalFrequencyPicker(context);
}
