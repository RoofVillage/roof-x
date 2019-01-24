import 'package:flutter/material.dart';
import 'package:form/index.dart';

class FormOptionSelectValueData extends StreamableData {
  String title;

  FormOptionSelectValueData({@required this.title, bool hidden})
      : super(hidden: hidden);
}
