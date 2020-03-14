import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class FieldContainer extends StatelessWidget {
  final Widget child;

  FieldContainer({this.child});

  final double _minHeight = 55.0;
  final double _verticalSpacing = 1;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final margin = EdgeInsets.only(
      top: _verticalSpacing,
    );

    final backgroundColor = theme.color.background.general;

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
      ),
      child: Center(child: child),
    );
  }
}
