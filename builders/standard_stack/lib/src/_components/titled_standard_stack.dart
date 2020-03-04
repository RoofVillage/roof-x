import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'standard_stack.dart';

class TitledStandardStack extends StatelessWidget {
  final List<Widget> children;
  final String title;

  TitledStandardStack({
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

    final stack = StandardStack(children: children);

    stackChildren.add(stack);
    return Column(children: stackChildren);
  }
}
