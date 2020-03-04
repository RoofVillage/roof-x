import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';

class RollerColumnBody<T> extends StatelessWidget {
  /// Builds a column of widgets from a [list] of int values repeated three times to allow simulated infinite scrolling, with the [selectedValue] highlighted.

  final LabeledValue<T> selectedValue;
  final List<LabeledValue<T>> list;
  final bool canRollover;
  final CrossAxisAlignment crossAxisAlignment;

  RollerColumnBody({
    @required this.selectedValue,
    @required this.list,
    this.crossAxisAlignment,
    canRollover,
  }) : this.canRollover = canRollover ?? false;

  final double _stepHeight = 40;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final activeStyle = theme.typography.bodyHeavy.textStyle(
      color: theme.color.text.generalPrimary,
    );

    final inactiveStyle = theme.typography.body.textStyle(
      color: theme.color.text.generalSecondary,
    );

    final widgetsLength = list.length * (canRollover ? 3 : 1);

    List<Widget> widgets = [];

    for (var i = 0; i < widgetsLength; i++) {
      final j = i % list.length;

      final style =
          (list[j].value == selectedValue.value) ? activeStyle : inactiveStyle;

      widgets.add(
        Container(
          height: _stepHeight,
          child: Text(
            list[j].label,
            textAlign: TextAlign.end,
            style: style,
          ),
        ),
      );
    }

    return Container(
      height: widgets.length * _stepHeight,
      child: Column(
        children: widgets,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      ),
    );
  }
}
