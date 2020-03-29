import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/fields/_widgets/index.dart';
import 'package:haptics/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tag_builder/index.dart';
import 'package:x_small_icon_library/index.dart';

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

    final rightArrow = Padding(
      padding: EdgeInsets.only(
        left: theme.distance.spacing.horizontal.small,
      ),
      child: XSmallIcon.rightArrow.buildWidget(
        color: theme.color.icon.generalSecondary,
      ),
    );

    final fieldBody = Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren,
            ),
          ),
          rightArrow,
        ],
      ),
    );

    return GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: onTap,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.small,
        ),
        child: fieldBody,
      ),
    );
  }
}
