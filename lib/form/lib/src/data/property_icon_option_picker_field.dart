import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:standard_icon_library/index.dart';

import 'icon_option_picker_field.dart';
import '../options/titled_icon.dart';

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

  static List<FormTitledIcon>
      _createFormTitledIcon() {
    return _propertyIconOptions.map(
      (icon) => FormTitledIcon(icon: icon),
    ).toList();
  }

  FormPropertyIconOptionPickerFieldData({
    @required String title,
    FormTitledIcon selectedOption,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          options: _createFormTitledIcon(),
          selectedOption: selectedOption,
          size: size,
          isVisible: isVisible,
        );
}
