import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:standard_icon_library/index.dart';

class FormIconOptionData extends StreamableData {
  StandardIcon icon;

  FormIconOptionData({@required this.icon}) : super();
}
