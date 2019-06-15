import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'field.dart';
import 'icon_option_select_value.dart';

class FormPropertyIconOptionSelectData
    extends StreamableFormFieldData<List<FormIconOptionSelectValueData>> {
  FormPropertyIconOptionSelectData({
    @required String title,
    List<FormIconOptionSelectValueData> initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
