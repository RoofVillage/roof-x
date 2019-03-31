import 'package:flutter/material.dart';
import 'package:date/index.dart';

import 'picker_field.dart';

class FormDateFieldData extends PickerFieldData<Date> {
  FormDateFieldData({
    @required String title,
    Date initialValue,
    DateTime startBound,
    DateTime endBound,
    Function onTap,
    double size,
  }) : super(
          title: title,
          initialValue: initialValue ?? Date.now(),
          startBound: startBound,
          endBound: endBound,
          onTap: onTap,
          size: size,
        );
}
