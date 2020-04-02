import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream/index.dart';

abstract class StreamableFormFieldData<T> extends StreamableData {
  final double size;
  final String title;
  final bool isRemovable;

  ValueChanged<T> get onChanged => (value) {
        for (final listener in _onChangedListeners) listener(value);
      };

  ValueChanged<bool> get onFocusChanged => (focusValue) {
        for (final listener in _onFocusChangedListeners) listener(focusValue);
      };

  bool get isTracked => _isTracked;
  double get fieldSize => size;
  bool get isInFocus => _isInFocus;

  List<ValueChanged<T>> _onChangedListeners = [];
  List<ValueChanged<bool>> _onFocusChangedListeners = [];
  bool _isTracked = false;
  bool isEnabled;
  T value;
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
    T initialValue,
    bool isRemovable,
    double size,
    bool isEnabled,
    bool isVisible,
  })  : size = size ?? 1,
        isRemovable = isRemovable ?? false,
        isEnabled = isEnabled ?? true,
        value = initialValue,
        _isInFocus = false,
        super(isVisible: isVisible);

  Future<void> validate() async {}

  void markAsTracked() {
    if (_isTracked) return;
    addOnChangedListener((newValue) => value = newValue);
    addOnFocusChangedListener((newFocusValue) => _isInFocus = newFocusValue);
    _isTracked = true;
  }
}
