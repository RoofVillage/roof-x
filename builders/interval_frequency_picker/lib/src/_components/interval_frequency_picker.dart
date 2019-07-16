import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frequency_type/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:titled_option_data/index.dart';
import 'package:roller_column_builder/index.dart';
import 'package:interval_frequency_schedule_data/index.dart';

class IntervalFrequencyPicker extends StatefulWidget {
  final IntervalFrequencyScheduleData selectedValue;
  final List<TitledOptionData<int>> intervalList;
  final List<TitledOptionData<FrequencyType>> frequencyList;
  final Function(IntervalFrequencyScheduleData) onChanged;

  IntervalFrequencyPicker({
    this.selectedValue,
    this.intervalList,
    this.frequencyList,
    this.onChanged,
  });

  IntervalFrequencyPickerState createState() => IntervalFrequencyPickerState();
}

class IntervalFrequencyPickerState extends State<IntervalFrequencyPicker>
    with RollerColumnBuilder {
  final double _verticalPadding = distance.c;
  final double _columnSpacing = distance.e;

  IntervalFrequencyScheduleData _selectedSchedule;

  @override
  void initState() {
    _selectedSchedule = widget.selectedValue ??
        IntervalFrequencyScheduleData(
          interval: widget.intervalList.first.data,
          frequency: widget.frequencyList.first.data,
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
        child: buildRollerColumn<FrequencyType>(
          context,
          list: widget.frequencyList,
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

  TitledOptionData<int> _rollerColumnDataFromInterval(int val) {
    for (TitledOptionData<int> data in widget.intervalList) {
      if (data.data == val) return data;
    }
    return null;
  }

  TitledOptionData<FrequencyType> _rollerColumnDataFromFrequency(
      FrequencyType val) {
    for (TitledOptionData<FrequencyType> data in widget.frequencyList) {
      if (data.data.toString() == val?.toString()) return data;
    }
    return null;
  }

  void _onIntervalChange(TitledOptionData<int> newVal) {
    if (_selectedSchedule.interval != newVal.data) {
      setState(() {
        _selectedSchedule.interval = newVal.data;
      });
      widget.onChanged(_selectedSchedule);
    }
  }

  void _onFrequencyChange(TitledOptionData<FrequencyType> newVal) {
    if (_selectedSchedule.frequency != newVal.data) {
      setState(() {
        _selectedSchedule.frequency = newVal.data;
      });
      widget.onChanged(_selectedSchedule);
    }
  }
}
