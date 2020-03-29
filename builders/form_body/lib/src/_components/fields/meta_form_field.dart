import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/fields/_widgets/index.dart';
import 'package:haptics/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tag_builder/index.dart';

class MetaFormField extends StatelessWidget
    with TagBuilder, KeyValueRowBuilder {
  final String title;
  final List<LabeledValue<String>> labeledValues;
  final VoidCallback onTap;

  MetaFormField({
    @required this.title,
    this.labeledValues,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> columnChildren = [];

    final label = FieldLabel(labelText: title);

    if (labeledValues != null && labeledValues.isNotEmpty) {
      columnChildren.add(label);

      final rows = labeledValues
          .map((labeledValue) => buildKeyValueRow(
                context,
                title: labeledValue.label ?? '',
                value: labeledValue.value ?? '',
                rightAlignValue: true,
              ))
          .toList();
      columnChildren.addAll(rows);
    } else {
      final emptyText = Text(
        'Not set',
        style: theme.typography.body.textStyle(
          color: theme.color.text.inputPlaceholder,
        ),
      );
      final row = Row(
        children: [
          Expanded(
            child: label,
          ),
          emptyText
        ],
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
      );
      columnChildren.add(row);
    }

    final fieldBody = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
    );

    return GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: onTap,
      ),
      child: Container(
        child: fieldBody,
      ),
    );
  }
}
