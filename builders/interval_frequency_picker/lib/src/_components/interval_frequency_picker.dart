import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frequency_type/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:roller_column_data/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:interval/index.dart';
import 'package:interval_frequency_option_data/index.dart';

class IntervalFrequencyPicker extends StatefulWidget {
  final IntervalFrequencyOptionData initialValue;
  final Function(IntervalFrequencyOptionData) onChanged;

  IntervalFrequencyPicker({this.initialValue, this.onChanged});

  IntervalFrequencyPickerState createState() => IntervalFrequencyPickerState();
}

class IntervalFrequencyPickerState extends State<IntervalFrequencyPicker>
    with RollerColumnPickerBuilder {
  final double _verticalPadding = distance.c;
  final double _columnSpacing = distance.e;

  final List<RollerColumnData<int>> _intervalList = [
    RollerColumnData(title: toIntervalString(0), data: 0),
    RollerColumnData(title: toIntervalString(1), data: 1),
    RollerColumnData(title: toIntervalString(2), data: 2)
  ];

  final List<RollerColumnData<FrequencyType>> _frequencyList = [
    RollerColumnData(
      title: "day",
      data: FrequencyType.fromString("daily"),
    ),
    RollerColumnData(
      title: "week",
      data: FrequencyType.fromString("weekly"),
    ),
    RollerColumnData(
      title: "month",
      data: FrequencyType.fromString("monthly"),
    )
  ];

  IntervalFrequencyOptionData _selectedSchedule;

  @override
  void initState() {
    _selectedSchedule = widget.initialValue ??
        IntervalFrequencyOptionData(
          interval: widget.initialValue.interval,
          frequency: widget.initialValue.frequency,
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget intervalColumn = Flexible(
      child: Container(
        padding: EdgeInsets.only(right: _columnSpacing / 2),
        child: buildRollerColumnPicker(
          context,
          list: _intervalList,
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
        child: buildRollerColumnPicker(
          context,
          list: _frequencyList,
          selectedValue: _rollerColumnDataFromFrequency(
            _selectedSchedule.frequency,
          ),
          crossAxisAlignment: CrossAxisAlignment.start,
          onChange: _onFrequencyChange,
        ),
      ),
    );

    List<Widget> columns = [
      intervalColumn,
      frequencyColumn,
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: columns,
      ),
    );
  }

  RollerColumnData<int> _rollerColumnDataFromInterval(int val) {
    for (RollerColumnData<int> data in _intervalList) {
      if (data.data == val) return data;
    }
    return null;
  }

  RollerColumnData<FrequencyType> _rollerColumnDataFromFrequency(
      FrequencyType val) {
    for (RollerColumnData<FrequencyType> data in _frequencyList) {
      if (data.data.toString() == val?.toString()) return data;
    }
    return null;
  }

  void _onIntervalChange(int newVal) {
    if (_selectedSchedule.interval != newVal) {
      setState(() {
        _selectedSchedule = IntervalFrequencyOptionData(
          interval: newVal,
          frequency: _selectedSchedule.frequency,
        );
      });
      widget.onChanged(_selectedSchedule);
    }
  }

  void _onFrequencyChange(FrequencyType newVal) {
    if (_selectedSchedule.frequency != newVal) {
      setState(() {
        _selectedSchedule = IntervalFrequencyOptionData(
          interval: _selectedSchedule.interval,
          frequency: newVal,
        );
      });
      widget.onChanged(_selectedSchedule);
    }
  }
}
