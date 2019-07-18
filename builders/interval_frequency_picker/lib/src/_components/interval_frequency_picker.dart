import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:period_type/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:labeled_value/index.dart';
import 'package:roller_column_builder/index.dart';
import 'package:frequency/index.dart';

class IntervalFrequencyPicker extends StatefulWidget {
  final Frequency selectedValue;
  final List<LabeledValue<int>> intervalList;
  final List<LabeledValue<PeriodType>> periodList;
  final Function(Frequency) onChanged;

  IntervalFrequencyPicker({
    this.selectedValue,
    this.intervalList,
    this.periodList,
    this.onChanged,
  });

  IntervalFrequencyPickerState createState() => IntervalFrequencyPickerState();
}

class IntervalFrequencyPickerState extends State<IntervalFrequencyPicker>
    with RollerColumnBuilder {
  final double _verticalPadding = distance.c;
  final double _columnSpacing = distance.e;

  Frequency _selectedSchedule;

  @override
  void initState() {
    _selectedSchedule = widget.selectedValue ??
        Frequency(
          interval: widget.intervalList.first.value,
          frequency: widget.periodList.first.value,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget intervalColumn = Flexible(
      child: Container(
        padding: EdgeInsets.only(right: _columnSpacing / 2),
        child: buildRollerColumn<int>(
          context,
          list: widget.intervalList,
          selectedValue: _rollerColumnDataFromInterval(
            _selectedSchedule.interval,
          ),
          crossAxisAlignment: CrossAxisAlignment.end,
          onChange: _onIntervalChange,
        ),
      ),
    );

    final Widget frequencyColumn = Flexible(
      child: Container(
        padding: EdgeInsets.only(left: _columnSpacing / 2),
        child: buildRollerColumn<PeriodType>(
          context,
          list: widget.periodList,
          selectedValue: _rollerColumnDataFromFrequency(
            _selectedSchedule.frequency,
          ),
          crossAxisAlignment: CrossAxisAlignment.start,
          onChange: _onFrequencyChange,
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          intervalColumn,
          frequencyColumn,
        ],
      ),
    );
  }

  LabeledValue<int> _rollerColumnDataFromInterval(int val) {
    for (LabeledValue<int> data in widget.intervalList) {
      if (data.value == val) return data;
    }
    return null;
  }

  LabeledValue<PeriodType> _rollerColumnDataFromFrequency(
      PeriodType val) {
    for (LabeledValue<PeriodType> data in widget.periodList) {
      if (data.value.toString() == val?.toString()) return data;
    }
    return null;
  }

  void _onIntervalChange(LabeledValue<int> newVal) {
    if (_selectedSchedule.interval != newVal.value) {
      setState(() {
        _selectedSchedule.interval = newVal.value;
      });
      widget.onChanged(_selectedSchedule);
    }
  }

  void _onFrequencyChange(LabeledValue<PeriodType> newVal) {
    if (_selectedSchedule.frequency != newVal.value) {
      setState(() {
        _selectedSchedule.frequency = newVal.value;
      });
      widget.onChanged(_selectedSchedule);
    }
  }
}
