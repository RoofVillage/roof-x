import 'package:flutter/material.dart';
import 'package:frequency/index.dart';
import 'package:interval/index.dart';
import 'package:period_type/index.dart';
import 'package:semantic_theme/index.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final int interval =
        selectedValue?.interval != null ? selectedValue.interval : 0;

    final PeriodType frequency = selectedValue?.frequency != null
        ? selectedValue.frequency
        : PeriodType.fromString("daily");

    String formattedValue =
        "${toIntervalString(interval)} ${frequency.inlineString}";

    final fieldBody = Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.small,
      ),
      child: Text(
        formattedValue,
        style: theme.typography.body.textStyle(
          color: theme.color.text.generalPrimary,
        ),
        textAlign: TextAlign.right,
      ),
    );

    return PickerField(
      onTap: onTap,
      name: title,
      fieldBody: fieldBody,
    );
  }
}
