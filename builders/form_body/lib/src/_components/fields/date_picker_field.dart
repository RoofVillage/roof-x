import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:date/index.dart';

import '_picker_field.dart';

class DatePickerField extends StatelessWidget {
  final String title;
  final DateTime initialValue;
  final DateTime startBound;
  final DateTime endBound;
  final bool autofocus;
  final TextInputType keyboardType;
  final Function(DateTime) onChanged;
  final Function(DateTime, BuildContext) onSubmitted;
  final Function(bool) onFocusChanged;
  final Function onTap;
  final FocusNode focusNode;

  DatePickerField({
    this.title,
    this.initialValue,
    this.startBound,
    this.endBound,
    this.autofocus,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onFocusChanged,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final String formattedValue = Date.fromDateTime(initialValue).toLongString;

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
