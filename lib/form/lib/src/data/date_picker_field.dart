import 'package:flutter/material.dart';
import 'package:date/index.dart';
import 'package:form/index.dart';

import '_mixins/on_tap_listener_adder.dart';

class FormDatePickerFieldData extends StreamableFormFieldData<Date>
    with OnTapListenerAdder {
  DateTime startBound;
  DateTime endBound;

  FormDatePickerFieldData({
    @required String title,
    Date initialValue,
    this.startBound,
    this.endBound,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue ?? Date.now(),
          size: size,
          isVisible: isVisible,
        );
}
