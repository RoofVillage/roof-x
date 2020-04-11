import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form/src/data/_mixins/on_tap_listener_adder.dart';

class MetaFormFieldData<T> extends StreamableFormFieldData<T>
    with OnTapListenerAdder {
  final Future<List<StreamableFormFieldData>> fieldsData;
  final T Function(List<StreamableFormFieldData>) valueFromFieldsData;
  final List<String> Function(T) _displayValues;
  final bool Function() validateForm;

  MetaFormFieldData({
    @required this.fieldsData,
    @required this.valueFromFieldsData,
    @required List<String> Function(T) displayValues,
    this.validateForm,
    T initialValue,
    String title,
    double size,
    bool isVisible,
    bool isRemovable,
    bool isEnabled,
  })  : _displayValues = displayValues,
        super(
          title: title,
          size: size,
          isVisible: isVisible,
          initialValue: initialValue,
          isEnabled: isEnabled,
          isRemovable: isRemovable,
        );

  get labeledValues => _displayValues(value);
}
