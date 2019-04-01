import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class PickerFieldData<T> extends StreamableFormFieldData<T> {
  T startBound;
  T endBound;

  Function get onTap => () {
        for (final listener in _onTapListeners) listener();
      };

  List<Function> _onTapListeners = [];

  void addOnTapListener(Function fn) {
    if (_onTapListeners.contains(fn)) return;
    _onTapListeners.add(fn);
  }

  PickerFieldData(
      {@required String title,
      T initialValue,
      T startBound,
      T endBound,
      double size,
      Function onTap})
      : super(
          title: title,
          initialValue: initialValue,
          size: size,
        );
}
