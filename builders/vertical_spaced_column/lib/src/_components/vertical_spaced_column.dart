import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class VerticalSpacedColumn extends StatelessWidget {
  final List<Widget> children;

  VerticalSpacedColumn({@required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> stackChildren = [];

    for (final child in children) {
      stackChildren.add(
        Padding(
          child: child,
          padding: EdgeInsets.only(
            top: theme.distance.spacing.vertical.medium,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.padding.horizontal.medium,
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Column(children: stackChildren),
    );
  }
}
