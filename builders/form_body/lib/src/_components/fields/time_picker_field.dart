import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

import '_picker_field.dart';

class TimePickerField extends StatelessWidget {
  final String title;
  final TimeOfDay initialValue;
  final Function(DateTime) onChanged;
  final Function onTap;

  TimePickerField({
    this.title,
    this.initialValue,
    this.onChanged,
    this.onTap,
  });

  final _typographyStyle = typography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    String formattedValue;

    if (initialValue != null) {
      formattedValue = initialValue.format(context);
    } else {
      final noon = TimeOfDay(hour: 12, minute: 0);
      formattedValue = noon.format(context);
    }

    final TextStyle textStyle = _typographyStyle.textStyleWithColor(
      RoofTheme.of(context).color.text.primary,
    );

    final verticalPadding = EdgeInsets.symmetric(vertical: distance.b);

    final fieldBody = Container(
      padding: verticalPadding,
      child: Text(
        formattedValue,
        style: textStyle,
        textAlign: TextAlign.right,
      ),
    );

    return RoofPickerField(
      onTap: onTap,
      name: title,
      fieldBody: fieldBody,
    );
  }
}
