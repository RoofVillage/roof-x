import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:labeled_value/index.dart';

import '_mixins/on_tap_listener_adder.dart';

class FormRollerColumnPickerFieldData<T> extends StreamableFormFieldData<LabeledValue<T>> with OnTapListenerAdder {
  List<LabeledValue<T>> buildOptions() => null;
  bool canRollover = false;

  FormRollerColumnPickerFieldData({
    String title,
    @required LabeledValue<T> selectedValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedValue,
          size: size,
          isVisible: isVisible,
        );
}
