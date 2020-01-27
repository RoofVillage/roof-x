import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class StandardStack extends StatelessWidget {
  final List<Widget> children;

  StandardStack({@required this.children});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> stackChildren = [];

    for (final child in children) {
      stackChildren.add(
        Padding(
          child: child,
          padding: EdgeInsets.only(
            top: theme.distance.spacing.vertical.small,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        left: theme.distance.padding.horizontal.small,
        right: theme.distance.padding.horizontal.small,
        bottom: theme.distance.padding.vertical.small,
      ),
      child: Column(children: stackChildren),
    );
  }
}
