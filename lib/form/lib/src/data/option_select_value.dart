import 'package:flutter/material.dart';
import 'package:stream/index.dart';

class FormOptionSelectValueData<T> extends StreamableData {
  String title;
  T data;

  FormOptionSelectValueData({@required this.title, this.data}) : super();
}
