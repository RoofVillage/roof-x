import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class KeyboardAccessoryShortBar extends StatelessWidget {
  final List<Widget> children;

  KeyboardAccessoryShortBar({this.children});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    return Container(
      height: theme.distance.spacing.vertical.large,
      child: row,
    );
  }
}
