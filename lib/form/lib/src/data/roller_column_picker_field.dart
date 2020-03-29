import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:labeled_value/index.dart';

import '_mixins/on_tap_listener_adder.dart';

class FormRollerColumnPickerFieldData<T>
    extends StreamableFormFieldData<LabeledValue<T>> with OnTapListenerAdder {
  final List<LabeledValue<T>> options;
  final bool infiniteScroll;

  FormRollerColumnPickerFieldData({
    String title,
    LabeledValue<T> selectedValue,
    @required this.options,
    double size,
    bool isVisible,
    bool infiniteScroll,
  })  : this.infiniteScroll = infiniteScroll ?? false,
        super(
          title: title,
          initialValue: selectedValue ?? options.first,
          size: size,
          isVisible: isVisible,
        );
}
