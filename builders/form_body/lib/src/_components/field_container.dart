import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;

  FieldContainer({this.child});

  final double _minHeight = 55.0;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final margin = EdgeInsets.only(
      top: theme.distance.spacing.vertical.min,
    );

    final backgroundColor = theme.color.background.raised;

    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.min,
        horizontal: theme.distance.padding.horizontal.medium,
      ),
      constraints: BoxConstraints(
        minHeight: _minHeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(theme.radius.small),
      ),
      child: Center(child: child),
    );
  }
}
