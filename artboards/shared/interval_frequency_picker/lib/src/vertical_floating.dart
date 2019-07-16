import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:interval_frequency_schedule_data/index.dart';
import 'package:titled_option_data/index.dart';
import 'package:frequency_type/index.dart';

class IntervalFrequencyPickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<IntervalFrequencyScheduleData>
    with IntervalFrequencyPickerArtboardBuilder {
  final IntervalFrequencyScheduleData selectedValue;
  final List<TitledOptionData<int>> intervalList;
  final List<TitledOptionData<FrequencyType>> frequencyList;

  IntervalFrequencyPickerVerticalFloatingArtboard(
      {this.selectedValue, this.intervalList, this.frequencyList});

  _IntervalFrequencyPickerVerticalFloatingArtboardState createState() =>
      _IntervalFrequencyPickerVerticalFloatingArtboardState();
}

class _IntervalFrequencyPickerVerticalFloatingArtboardState
    extends State<IntervalFrequencyPickerVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<
            IntervalFrequencyPickerVerticalFloatingArtboard>,
        IntervalFrequencyPickerArtboardBuilderState<
            IntervalFrequencyPickerVerticalFloatingArtboard> {
  @override
  IntervalFrequencyScheduleData get selectedSchedule =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedSchedule(IntervalFrequencyScheduleData newValue) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newValue;
  }

  @override
  Widget buildBody(BuildContext context) =>
      buildIntervalFrequencyPicker(context);
}
