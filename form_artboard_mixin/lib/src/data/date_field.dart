import 'package:flutter/material.dart';

import 'picker_field.dart';

class FormDateFieldData extends PickerFieldData<DateTime> {
  FormDateFieldData({
    @required String title,
    DateTime initialValue,
    DateTime startBound,
    DateTime endBound,
    Function onTap,
    double size,
  }) : super(
          title: title,
          initialValue: initialValue ?? DateTime.now(),
          startBound: startBound,
          endBound: endBound,
          onTap: onTap,
          size: size,
        );
}
