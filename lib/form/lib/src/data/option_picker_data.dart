import 'package:flutter/material.dart';
import 'package:stream/index.dart';

class FormOptionPickerData<T> extends StreamableData {
  String title;
  T data;

  FormOptionPickerData({@required this.title, this.data}) : super();
}
