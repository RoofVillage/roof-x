import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final String formattedValue = initialValue != null
        ? initialValue.format(context)
        : TimeOfDay(hour: 12, minute: 0).format(context);

    final verticalPadding = EdgeInsets.symmetric(
      vertical: theme.distance.padding.vertical.small,
    );

    final fieldBody = Container(
      padding: verticalPadding,
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
