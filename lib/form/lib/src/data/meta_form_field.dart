import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form/src/data/_mixins/on_tap_listener_adder.dart';
import 'package:labeled_value/index.dart';

class MetaFormFieldData<T> extends StreamableFormFieldData<T>
    with OnTapListenerAdder {
  final Future<List<StreamableFormFieldData>> fieldsData;
  final T Function(List<StreamableFormFieldData>) valueFromFieldsData;
  final List<LabeledValue<String>> Function(T) _labeledValuesFromValue;
  final bool Function() validateForm;

  MetaFormFieldData({
    @required this.fieldsData,
    @required this.valueFromFieldsData,
    @required List<LabeledValue<String>> Function(T) labeledValuesFromValue,
    this.validateForm,
    T initialValue,
    String title,
    double size,
    bool isVisible,
    bool isEnabled,
  })  : _labeledValuesFromValue = labeledValuesFromValue,
        super(
          title: title,
          size: size,
          isVisible: isVisible,
          initialValue: initialValue,
          isEnabled: isEnabled,
        );

  get labeledValues => _labeledValuesFromValue(value);
}
