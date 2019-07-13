import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'package:standard_icon_library/index.dart';

class FormIconPickerData extends StreamableData {
  StandardIcon icon;

  FormIconPickerData({@required this.icon}) : super();
}
