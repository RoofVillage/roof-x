import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class PickerFieldData<T> extends StreamableFormFieldData<T> {
  T startBound;
  T endBound;

  PickerFieldData({
    @required String title,
    T initialValue,
    T startBound,
    T endBound,
    double size,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
        );
}
