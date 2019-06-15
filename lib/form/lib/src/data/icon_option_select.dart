import 'package:flutter/material.dart';
import 'package:form/index.dart';

import 'field.dart';
import 'icon_option_select_value.dart';

class FormIconOptionSelectData
    extends StreamableFormFieldData<FormIconOptionSelectValueData> {
  List<FormIconOptionSelectValueData> options;

  FormIconOptionSelectData({
    this.options,
    @required String title,
    FormIconOptionSelectValueData initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
