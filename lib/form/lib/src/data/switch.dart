import 'package:flutter/material.dart';

import 'field.dart';

class FormSwitchFieldData extends StreamableFormFieldData<bool> {
  FormSwitchFieldData({
    @required String title,
    bool initialValue = false,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
