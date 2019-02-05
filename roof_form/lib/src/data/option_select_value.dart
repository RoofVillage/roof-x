import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:stream/index.dart';

class FormOptionSelectValueData extends StreamableData {
  final String title;

  FormOptionSelectValueData({@required this.title, bool hidden})
      : super(hidden: hidden);
}
