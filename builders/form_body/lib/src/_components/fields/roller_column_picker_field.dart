import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';

import '_picker_field.dart';

class RollerColumnPickerField extends StatelessWidget {
  final String title;
  final LabeledValue selectedValue;
  final Function() onChanged;
  final Function onTap;

  RollerColumnPickerField({
    this.title,
    this.selectedValue,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final fieldBody = Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.small,
      ),
      child: Text(
        selectedValue.label,
        style: theme.typography.body.textStyle(
          color: theme.color.text.generalPrimary,
        ),
        textAlign: TextAlign.right,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return PickerField(
      onTap: onTap,
      name: title,
      fieldBody: fieldBody,
    );
  }
}
