import 'package:flutter/material.dart';

import '../../stream/roofui_streamable_data.dart';

abstract class RoofUIFormFieldData extends RoofUIStreamableData {
  String title;

  RoofUIFormFieldData({@required this.title, hidden})
      : super(id: title, hidden: hidden);
}
