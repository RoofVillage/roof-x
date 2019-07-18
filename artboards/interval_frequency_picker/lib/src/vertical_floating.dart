import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:frequency/index.dart';
import 'package:labeled_value/index.dart';
import 'package:period_type/index.dart';

class IntervalFrequencyPickerVerticalFloatingArtboard
    extends EmptyVerticalFloatingArtboard<Frequency>
    with IntervalFrequencyPickerArtboardBuilder {
  final Frequency selectedValue;
  final List<LabeledValue<int>> intervalList;
  final List<LabeledValue<PeriodType>> periodList;

  IntervalFrequencyPickerVerticalFloatingArtboard(
      {this.selectedValue, this.intervalList, this.periodList});

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
  Frequency get selectedSchedule =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedSchedule(Frequency newValue) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result = newValue;
  }

  @override
  Widget buildBody(BuildContext context) =>
      buildIntervalFrequencyPicker(context);
}
