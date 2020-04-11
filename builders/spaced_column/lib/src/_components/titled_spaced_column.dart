import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'spaced_column.dart';

class TitledSpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final String title;

  TitledSpacedColumn({
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

    final stack = SpacedColumn(children: children);

    stackChildren.add(stack);
    return Column(children: stackChildren);
  }
}
