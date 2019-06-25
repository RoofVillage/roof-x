import 'package:flutter/material.dart';

import 'field.dart';

abstract class PickerFieldData<T> extends StreamableFormFieldData<T> {
  Function get onTap => () {
        for (final listener in _onTapListeners) listener();
      };

  List<Function> _onTapListeners = [];

  void addOnTapListener(Function fn) {
    if (_onTapListeners.contains(fn)) return;
    _onTapListeners.add(fn);
  }

  PickerFieldData({
    @required String title,
    T initialValue,
    double size,
    bool isVisible,
    Function onTap,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
