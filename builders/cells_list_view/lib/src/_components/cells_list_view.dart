import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class RoofCellsListView extends StatefulWidget {
  final List<Widget> children;
  final Widget button;

  RoofCellsListView({
    this.children,
    this.button,
  });

  @override
  _RoofCellsListViewState createState() => _RoofCellsListViewState();
}

class _RoofCellsListViewState extends State<RoofCellsListView> {
  final _spacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> listChildren = [];

    if (widget.button != null) {
      final paddedButton = Container(
        margin: EdgeInsets.only(top: _spacing),
        child: widget.button,
      );
      listChildren.add(paddedButton);
    }

    listChildren.addAll(widget.children);

    return Container(
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
      ),
      color: theme.color.background.inputBackground,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: listChildren,
      ),
    );
  }
}
