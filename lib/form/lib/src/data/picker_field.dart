import 'package:flutter/material.dart';

import 'field.dart';

abstract class FormPickerFieldData<T> extends StreamableFormFieldData<T> {
  Function get onTap => () {
        for (final listener in _onTapListeners) listener();
      };

  List<Function> _onTapListeners = [];

  void addOnTapListener(Function fn) {
    if (_onTapListeners.contains(fn)) return;
    _onTapListeners.add(fn);
  }

  FormPickerFieldData({
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
