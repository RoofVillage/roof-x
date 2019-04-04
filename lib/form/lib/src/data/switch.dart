import 'package:flutter/material.dart';

import 'field.dart';

class FormSwitchData extends StreamableFormFieldData<bool> {
  FormSwitchData({
    @required String title,
    bool initialValue = false,
    double size,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
        );
}
