import 'package:flutter/material.dart';
import 'package:stream/streamable_data.dart';

class StreamableFormFieldData<T> extends StreamableData {
  final int rowSlots;
  final int slots;
  final bool forceNewRow;
  ValueChanged<T> onChanged;

  T get value => _value;
  set value(T value) {
    _onChanged(value);
  }

  final ValueChanged<T> _onChanged;
  T _value;

  StreamableFormFieldData({
    T initialValue,
    this.rowSlots = 1,
    this.slots = 1,
    this.forceNewRow = false,
    ValueChanged<T> onChanged,
    bool hidden = false,
  })  : _value = initialValue,
        _onChanged = onChanged,
        super(hidden: hidden);
}
