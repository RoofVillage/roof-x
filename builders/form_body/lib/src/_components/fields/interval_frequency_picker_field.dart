import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:frequency/index.dart';
import 'package:interval/index.dart';
import 'package:period_type/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

import '_picker_field.dart';

class IntervalFrequencyPickerField extends StatelessWidget {
  final String title;
  final Frequency selectedValue;
  final Function(Frequency) onChanged;
  final Function onTap;

  IntervalFrequencyPickerField({
    this.title,
    this.selectedValue,
    this.onChanged,
    this.onTap,
  });

  final _typographyStyle = typography.body;

  @override
  Widget build(BuildContext context) {
    final int interval =
        selectedValue?.interval != null ? selectedValue.interval : 0;
    final PeriodType frequency = selectedValue?.frequency != null
        ? selectedValue.frequency
        : PeriodType.fromString("daily");

    String formattedValue =
        "${toIntervalString(interval)} ${frequency.inlineString}";

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
