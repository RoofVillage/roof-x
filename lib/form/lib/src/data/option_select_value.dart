import 'package:flutter/material.dart';
import 'package:stream/index.dart';

class FormOptionSelectValueData extends StreamableData {
  String title;
  String data;

  FormOptionSelectValueData({@required this.title, this.data}) : super();
}
