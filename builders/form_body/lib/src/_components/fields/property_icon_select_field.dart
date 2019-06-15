import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';

import 'icon_select_field.dart';
import '_data/icon_select_field_option_data.dart';

class PropertyIconSelectField extends StatelessWidget {
  final String title;
  final IconSelectFieldOptionData selectedOption;
  final Function(IconSelectFieldOptionData) onChanged;

  PropertyIconSelectField({
    this.title,
    this.selectedOption,
    this.onChanged,
  });

  final List<StandardIcon> _propertyIconOptions = [
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

  List<IconSelectFieldOptionData> _buildOptions() {
    return _propertyIconOptions.map(
      (propertyIcon) {
        return IconSelectFieldOptionData(icon: propertyIcon);
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return IconSelectField(
      title: title,
      selectedOption: selectedOption,
      options: _buildOptions(),
      onChanged: onChanged,
    );
  }
}
