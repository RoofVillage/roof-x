import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream/index.dart';

abstract class StreamableFormFieldData<T> extends StreamableData {
  final double size;
  final String title;

  List<ValueChanged<T>> _onChangedListeners = [];
  List<ValueChanged<bool>> _onFocusChangedListeners = [];
  ValueChanged<T> get onChanged => (value) {
        for (final listener in _onChangedListeners) listener(value);
      };

  ValueChanged<bool> get onFocusChanged => (focusValue) {
        for (final listener in _onFocusChangedListeners) listener(focusValue);
      };

  bool _tracked = false;
  bool get tracked => _tracked;

  bool enabled;

  double get fieldSize => size;

  T get value => _value;

  bool get isInFocus => _isInFocus;

  T _value;

  bool _isInFocus;

  void addOnChangedListener(ValueChanged<T> fn) {
    if (_onChangedListeners.contains(fn)) return;
    _onChangedListeners.add(fn);
  }

  void addOnFocusChangedListener(ValueChanged<bool> fn) {
    if (_onFocusChangedListeners.contains(fn)) return;
    _onFocusChangedListeners.add(fn);
  }

  StreamableFormFieldData({
    @required this.title,
    String placeholder,
    T initialValue,
    double size,
    bool enabled,
  })  : size = size ?? 1,
        enabled = enabled ?? true,
        _value = initialValue,
        _isInFocus = false,
        super() {
    addOnChangedListener((newValue) => _value = newValue);
    addOnFocusChangedListener((newFocusValue) => _isInFocus = newFocusValue);
  }

  Future<void> validate() async {}

  void markAsTracked() => _tracked = true;
}
