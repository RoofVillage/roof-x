import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

class RoofSpacedColumn extends StatelessWidget {
  final List<Widget> children;
  final double verticalSpacing;

  RoofSpacedColumn({@required this.children, this.verticalSpacing});

  final _defaultVerticalSpacing = distance.a;

  @override
  Widget build(BuildContext context) {
    final _verticalPadding = EdgeInsets.symmetric(
      vertical: verticalSpacing ?? _defaultVerticalSpacing,
    );

    final List<Widget> widgets = [];

    for (final child in children) {
      widgets.add(
        Padding(
          child: child,
          padding: _verticalPadding,
        ),
      );
    }

    return Column(children: widgets);
  }
}
