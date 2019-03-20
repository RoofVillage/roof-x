import 'package:flutter/material.dart';
import 'package:stream/index.dart';

class StreamableFormFieldValueData<T> extends StreamableData {
  T value;
  final bool isInFocus;

  String get fieldKey => key;

  StreamableFormFieldValueData({
    @required String fieldKey,
    this.value,
    this.isInFocus,
    bool hidden = false,
  }) : super(key: fieldKey, hidden: hidden);
}
