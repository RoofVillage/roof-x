import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:standard_icon_library/index.dart';

class FormIconOptionSelectValueData extends StreamableData {
  StandardIcon icon;

  FormIconOptionSelectValueData({@required this.icon}) : super();
}
