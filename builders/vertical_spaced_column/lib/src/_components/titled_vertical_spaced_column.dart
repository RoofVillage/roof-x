import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'vertical_spaced_column.dart';

class TitledVerticalSpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final String title;

  TitledVerticalSpacedColumn({
    @required this.title,
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> stackChildren = [];
    stackChildren.add(
      Text(
        title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      ),
    );

    final stack = VerticalSpacedColumn(children: children);

    stackChildren.add(stack);
    return Column(children: stackChildren);
  }
}
