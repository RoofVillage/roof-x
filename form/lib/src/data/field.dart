import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream/index.dart';

abstract class StreamableFormFieldData<T> extends StreamableData {
  final double size;
  ValueChanged<T> onChanged;
  ValueChanged<bool> onFocusChanged;

  bool _tracked = false;
  bool get tracked => _tracked;

  bool enabled;

  double get fieldSize => size;

  T get value => _value;
  set value(T value) {
    _value = value;
    if (_onChanged != null) _onChanged(value);
  }

  bool get isInFocus => _isInFocus;
  set isInFocus(bool focusValue) {
    _isInFocus = focusValue;
    if (_onFocusChanged != null) _onFocusChanged(focusValue);
  }

  final ValueChanged<T> _onChanged;
  T _value;

  final ValueChanged<bool> _onFocusChanged;
  bool _isInFocus;

  StreamableFormFieldData({
    String title,
    String placeholder,
    T initialValue,
    double size,
    bool enabled,
    ValueChanged<T> onChanged,
    ValueChanged<bool> onFocusChanged,
    bool hidden,
  })  : size = size ?? 1,
        enabled = enabled ?? true,
        _value = initialValue,
        _isInFocus = false,
        _onChanged = onChanged,
        _onFocusChanged = onFocusChanged,
        super(hidden: hidden);

  Future<void> validate() async {}

  void markAsTracked() => _tracked = true;
}
