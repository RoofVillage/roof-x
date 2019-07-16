import 'package:flutter/material.dart';
import 'package:stream/index.dart';

class FormTitledOptionData<T> extends StreamableData {
  String title;
  T data;

  FormTitledOptionData({@required this.title, this.data}) : super();
}
