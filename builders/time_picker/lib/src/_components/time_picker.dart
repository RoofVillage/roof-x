import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labeled_value/index.dart';
import 'package:roller_column_builder/index.dart';
import 'package:semantic_theme/index.dart';

import '_clock_type.dart';

class TimePicker extends StatefulWidget {
  final TimeOfDay initialValue;
  final Function(TimeOfDay) onChanged;

  TimePicker({
    this.initialValue,
    this.onChanged,
  });

  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> with RollerColumnBuilder {
  final int _minutesSpacing = 5;

  final List<LabeledValue<int>> _minutesList = [];
  final List<LabeledValue<int>> _hoursList = [];
  final List<LabeledValue<ClockType>> _clockTypeList = [
    LabeledValue(
      label: "am",
      value: ClockType.am,
    ),
    LabeledValue(
      label: "pm",
      value: ClockType.pm,
    ),
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
      final data = LabeledValue<int>(
        label: i.toString().padLeft(2, "0"),
        value: i,
      );
      _minutesList.add(data);
    }

    // Generate _hoursList
    int hoursLength = _use24HourFormat ? 24 : 12;
    for (int i = 0; i < hoursLength; i++) {
      String label;

      if (_use24HourFormat) {
        label = i.toString();
      } else {
        label = i == 0 ? "12" : i.toString();
      }

      _hoursList.add(
        LabeledValue<int>(
          label: label,
          value: i,
        ),
      );
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final columnWidth = theme.distance.spacing.horizontal.max;

    final selectedHour = _rollerColumnDataFromHour(_selectedTime.hour);

    final Widget hoursColumn = Flexible(
      child: Container(
        width: columnWidth,
        child: buildRollerColumn(
          context,
          list: _hoursList,
          selectedValue: selectedHour,
          onChange: _onHoursChange,
        ),
      ),
    );

    final timeDividerTextStyle = theme.typography.body.textStyle(
      color: theme.color.text.generalSecondary,
    );
    final Widget timeDivider = Flexible(
      child: Container(
        width: columnWidth / 2,
        child: Center(
          child: Text(
            ":",
            style: timeDividerTextStyle,
          ),
        ),
      ),
    );

    final Widget minutesColumn = Flexible(
      child: Container(
        width: columnWidth,
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
          width: columnWidth,
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

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.medium,
      ),
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

  LabeledValue<int> _rollerColumnDataFromMinute(int val) {
    for (LabeledValue<int> data in _minutesList) {
      if ((data.value - val).abs() < _minutesSpacing / 2) return data;
    }
    return null;
  }

  LabeledValue<int> _rollerColumnDataFromHour(int val) {
    int _val = _use24HourFormat ? val : val % 12;

    for (LabeledValue<int> data in _hoursList) {
      if (_val == data.value) return data;
    }
    return null;
  }

  LabeledValue<ClockType> _rollerColumnDataFromClockType(ClockType val) {
    for (LabeledValue<ClockType> data in _clockTypeList) {
      if (val == data.value) return data;
    }
    return null;
  }

  void _onMinutesChange(LabeledValue<int> newVal) {
    if (_selectedTime.minute != newVal.value) {
      setState(() {
        _selectedTime = TimeOfDay(
          hour: _selectedTime.hour,
          minute: newVal.value,
        );
      });
      widget.onChanged(_selectedTime);
    }
  }

  _onHoursChange(LabeledValue<int> newVal) {
    if (_selectedTime.hour != newVal.value) {
      int hour = _use24HourFormat
          ? newVal.value
          : newVal.value + (_clockType == ClockType.pm ? 12 : 0);

      setState(() {
        _selectedTime = TimeOfDay(hour: hour, minute: _selectedTime.minute);
      });
      widget.onChanged(_selectedTime);
    }
  }

  _onClockTypeChange(LabeledValue<ClockType> newVal) {
    if (_clockType != newVal.value) {
      final newSelectedTime = TimeOfDay(
        hour: _selectedTime.hour + (newVal.value == ClockType.am ? -12 : 12),
        minute: _selectedTime.minute,
      );
      setState(() {
        _clockType = newVal.value;
        _selectedTime = newSelectedTime;
      });
      widget.onChanged(_selectedTime);
    }
  }
}
