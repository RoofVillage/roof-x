import 'package:flutter/material.dart';

import 'package:roofui_kit/form/data/roofui_form_field_data.dart';

class NameFieldData extends RoofUIFormFieldData {
  final String title;

  NameFieldData({@required this.title}) : super(title: title);
}

class FieldRowData extends RoofUIFormFieldData {
  final List<RoofUIFormFieldData> fields;

  FieldRowData({@required this.fields})
      : assert(fields.length > 0),
        super(title: fields.first.id);
}
