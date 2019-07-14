import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:option_picker_data/index.dart';
import 'package:roller_column_builder/index.dart';

import '_clock_type.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay initialValue;
  final Function(TimeOfDay) onChanged;

  TimePicker({this.initialValue, this.onChanged});

  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> with RollerColumnBuilder {
  final int _minutesSpacing = 5;
  final double _columnWidth = distance.f;
  final double _verticalPadding = distance.c;

  final List<OptionPickerData<int>> _minutesList = [];
  final List<OptionPickerData<int>> _hoursList = [];
  final List<OptionPickerData<ClockType>> _clockTypeList = [
    OptionPickerData(title: "am", data: ClockType.am),
    OptionPickerData(title: "pm", data: ClockType.pm),
  ];

  TimeOfDay _selectedTime;
  ClockType _clockType;
  bool _use24HourFormat;

  @override
  void initState() {
    _selectedTime = widget.initialValue ?? TimeOfDay(hour: 12, minute: 0);

    _clockType = _clockTypeFromHour(_selectedTime.hour);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _use24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;

    // Generate _minutesList
    for (int i = 0; i <= 60 - _minutesSpacing; i += _minutesSpacing) {
      final data = OptionPickerData<int>(
        title: i.toString().padLeft(2, "0"),
        data: i,
      );
      _minutesList.add(data);
    }

    // Generate _hoursList
    int hoursLength = _use24HourFormat ? 24 : 12;
    for (int i = 0; i < hoursLength; i++) {
      String title;

      if (_use24HourFormat) {
        title = i.toString();
      } else {
        title = i == 0 ? "12" : i.toString();
      }

      _hoursList.add(
        OptionPickerData<int>(
          title: title,
          data: i,
        ),
      );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final selectedHour = _rollerColumnDataFromHour(_selectedTime.hour);

    final Widget hoursColumn = Flexible(
      child: Container(
        width: _columnWidth,
        child: buildRollerColumn(
          context,
          list: _hoursList,
          selectedValue: selectedHour,
          onChange: _onHoursChange,
        ),
      ),
    );

    final timeDividerTextStyle = typography.body.textStyleWithColor(
      RoofTheme.of(context).color.text.secondary,
    );
    final Widget timeDivider = Flexible(
      child: Container(
        width: _columnWidth / 2,
        child: Center(
          child: Text(":", style: timeDividerTextStyle),
        ),
      ),
    );

    final Widget minutesColumn = Flexible(
      child: Container(
        width: _columnWidth,
        child: buildRollerColumn(
          context,
          list: _minutesList,
          selectedValue: _rollerColumnDataFromMinute(_selectedTime.minute),
          onChange: _onMinutesChange,
        ),
      ),
    );

    List<Widget> columns = [
      hoursColumn,
      timeDivider,
      minutesColumn,
    ];

    if (!_use24HourFormat) {
      final ClockType clockType = _clockTypeFromHour(_selectedTime.hour);

      final Widget clockTypeColumn = Flexible(
        child: Container(
          width: _columnWidth,
          child: buildRollerColumn(
            context,
            list: _clockTypeList,
            selectedValue: _rollerColumnDataFromClockType(clockType),
            onChange: _onClockTypeChange,
          ),
        ),
      );
      columns.add(clockTypeColumn);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: columns,
      ),
    );
  }

  ClockType _clockTypeFromHour(int hour) {
    return hour < 11 ? ClockType.am : ClockType.pm;
  }

  OptionPickerData<int> _rollerColumnDataFromMinute(int val) {
    for (OptionPickerData<int> data in _minutesList) {
      if ((data.data - val).abs() < _minutesSpacing / 2) return data;
    }
    return null;
  }

  OptionPickerData<int> _rollerColumnDataFromHour(int val) {
    int _val = _use24HourFormat ? val : val % 12;

    for (OptionPickerData<int> data in _hoursList) {
      if (_val == data.data) return data;
    }
    return null;
  }

  OptionPickerData<ClockType> _rollerColumnDataFromClockType(ClockType val) {
    for (OptionPickerData<ClockType> data in _clockTypeList) {
      if (val == data.data) return data;
    }
    return null;
  }

  void _onMinutesChange(OptionPickerData<int> newVal) {
    if (_selectedTime.minute != newVal.data) {
      setState(() {
        _selectedTime = TimeOfDay(
          hour: _selectedTime.hour,
          minute: newVal.data,
        );
      });
      widget.onChanged(_selectedTime);
    }
  }

  _onHoursChange(OptionPickerData<int> newVal) {
    if (_selectedTime.hour != newVal.data) {
      int hour = _use24HourFormat
          ? newVal.data
          : newVal.data + (_clockType == ClockType.pm ? 12 : 0);

      setState(() {
        _selectedTime = TimeOfDay(hour: hour, minute: _selectedTime.minute);
      });
      widget.onChanged(_selectedTime);
    }
  }

  _onClockTypeChange(OptionPickerData<ClockType> newVal) {
    if (_clockType != newVal.data) {
      final newSelectedTime = TimeOfDay(
        hour: _selectedTime.hour + (newVal.data == ClockType.am ? -12 : 12),
        minute: _selectedTime.minute,
      );
      setState(() {
        _clockType = newVal.data;
        _selectedTime = newSelectedTime;
      });
      widget.onChanged(_selectedTime);
    }
  }
}
