import 'package:flutter/material.dart';
import 'package:stream/index.dart';

abstract class StreamableFormFieldData<T> extends StreamableData {
  final double size;
  ValueChanged<T> onChanged;

  double get fieldSize => size;

  T get value => _value;
  set value(T value) {
    if (_onChanged != null) _onChanged(value);
  }

  final ValueChanged<T> _onChanged;
  T _value;

  StreamableFormFieldData({
    String title,
    String placeholder,
    T initialValue,
    double size,
    ValueChanged<T> onChanged,
    bool hidden,
  })  : size = size ?? 1,
        _value = initialValue,
        _onChanged = onChanged,
        super(hidden: hidden);

  Future<void> validate() async {}
}
