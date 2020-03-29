import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';

class RollerColumnBody<T> extends StatelessWidget {
  /// Builds a column of widgets from a [children] of int values repeated three times to allow simulated infinite scrolling, with the [selectedValue] highlighted.

  final LabeledValue<T> selectedValue;
  final List<LabeledValue<T>> children;
  final int segmentCount;
  final CrossAxisAlignment crossAxisAlignment;

  RollerColumnBody({
    @required this.selectedValue,
    @required this.children,
    this.crossAxisAlignment,
    int segmentCount,
  }) : this.segmentCount = segmentCount ?? 1;

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

    final widgetsLength = children.length * segmentCount;

    List<Widget> widgets = [];

    for (var i = 0; i < widgetsLength; i++) {
      final j = i % children.length;

      final style =
          (children[j].value == selectedValue.value) ? activeStyle : inactiveStyle;

      widgets.add(
        Container(
          height: _stepHeight,
          child: Text(
            children[j].label,
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
