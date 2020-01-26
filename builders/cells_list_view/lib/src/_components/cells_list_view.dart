import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semantic_theme/index.dart';

class CellsListView extends StatefulWidget {
  final List<Widget> children;
  final Widget button;

  CellsListView({
    this.children,
    this.button,
  });

  @override
  _CellsListViewState createState() => _CellsListViewState();
}

class _CellsListViewState extends State<CellsListView> {
  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> listChildren = [];

    if (widget.button != null) {
      final paddedButton = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.medium,
        ),
        child: widget.button,
      );
      listChildren.add(paddedButton);
    }

    listChildren.addAll(widget.children);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.padding.horizontal.small,
      ),
      color: theme.color.background.inputBackground,
      child: ListView(
        padding: EdgeInsets.only(
          bottom: theme.distance.padding.vertical.medium,
        ),
        children: listChildren,
      ),
    );
  }
}
