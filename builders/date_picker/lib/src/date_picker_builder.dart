import 'package:flutter/material.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';

import 'components/index.dart';

//Date pickers must be an artboard
mixin DatePickerBuilder implements Artboard<Date> {
  Date get selectedDate;
  Date get startBound;
  Date get endBound;
}

mixin DatePickerBuilderState<T extends DatePickerBuilder> implements State<T> {
  Date _date;

  Date get date => _date;
  set date(Date newDate) => _date = newDate;

  Widget buildDatePicker(BuildContext context) {
    return RoofCalendarDatePicker(
      selectedDate: date ?? widget.selectedDate,
      startBound: widget.startBound,
      endBound: widget.endBound,
      onDayPressed: _onDayPressed,
    );
  }

  void _onDayPressed(Date newDate) {
    triggerHapticWith(HapticOption.click);
    date = newDate;
  }
}
