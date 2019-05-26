import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class RoofCellsListView extends StatelessWidget {
  final List<Widget> children;
  final Widget button;

  RoofCellsListView({this.children, this.button});

  final _spacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    if (button != null) {
      final paddedButton = Container(
        margin: EdgeInsets.only(top: _spacing),
        child: button,
      );
      children.insert(0, paddedButton);
    }

    return Container(
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: children,
      ),
    );
  }
}
