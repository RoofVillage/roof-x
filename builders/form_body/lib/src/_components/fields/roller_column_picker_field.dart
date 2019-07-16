import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:titled_value/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

import '_picker_field.dart';

class RollerColumnPickerField extends StatelessWidget {
  final String title;
  final TitledValue selectedValue;
  final Function() onChanged;
  final Function onTap;

  RollerColumnPickerField({
    this.title,
    this.selectedValue,
    this.onChanged,
    this.onTap,
  });

  final _typographyStyle = typography.body;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = _typographyStyle.textStyleWithColor(
      RoofTheme.of(context).color.text.primary,
    );

    final verticalPadding = EdgeInsets.symmetric(vertical: distance.b);

    final fieldBody = Container(
      padding: verticalPadding,
      child: Text(
        selectedValue.title,
        style: textStyle,
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return RoofPickerField(
      onTap: onTap,
      name: title,
      fieldBody: fieldBody,
    );
  }
}
