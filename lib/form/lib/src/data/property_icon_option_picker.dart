import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:standard_icon_library/index.dart';

import '../options/icon_option_data.dart';

class FormPropertyIconOptionPickerFieldData extends FormIconPickerFieldData {
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

  static List<FormIconOptionData>
      _createFormIconOptionData() {
    return _propertyIconOptions.map(
      (icon) => FormIconOptionData(icon: icon),
    ).toList();
  }

  FormPropertyIconOptionPickerFieldData({
    @required String title,
    FormIconOptionData selectedOption,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          options: _createFormIconOptionData(),
          selectedOption: selectedOption,
          size: size,
          isVisible: isVisible,
        );
}
