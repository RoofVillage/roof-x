import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:standard_icon_library/index.dart';

import 'icon_option_select_value.dart';

class FormPropertyIconOptionSelectData extends FormIconOptionSelectData {
  static final List<StandardIcon> _propertyIconOptions = [
    StandardIcon.house1,
    StandardIcon.house2,
    StandardIcon.house3,
    StandardIcon.house4,
    StandardIcon.house5,
    StandardIcon.house6,
    StandardIcon.house7,
    StandardIcon.house8,
    StandardIcon.house9,
    StandardIcon.apartment1,
    StandardIcon.apartment2,
    StandardIcon.apartment3,
    StandardIcon.apartment4,
    StandardIcon.apartment5,
    StandardIcon.tent,
    StandardIcon.igloo,
    StandardIcon.camper,
    StandardIcon.treehouse,
  ];

  static List<FormIconOptionSelectValueData>
      _createFormIconOptionSelectValueData() {
    return _propertyIconOptions.map(
      (icon) => FormIconOptionSelectValueData(icon: icon),
    ).toList();
  }

  FormPropertyIconOptionSelectData({
    @required String title,
    FormIconOptionSelectValueData initialValue,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          options: _createFormIconOptionSelectValueData(),
          initialValue: initialValue,
          size: size,
          isVisible: isVisible,
        );
}
