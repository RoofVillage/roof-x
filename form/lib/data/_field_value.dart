import 'package:flutter/material.dart';
import 'package:stream/streamable_data.dart';

class StreamableFormFieldValueData<T> extends StreamableData {
  T value;

  String get fieldKey => key;

  StreamableFormFieldValueData({
    @required String fieldKey,
    this.value,
    bool hidden = false,
  }) : super(key: fieldKey, hidden: hidden);
}
