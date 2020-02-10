import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semantic_theme/index.dart';

class CellsListView extends StatefulWidget {
  final List<Widget> children;
  final Widget button;
  final bool buttonIsLast;

  CellsListView({
    this.children,
    this.button,
    this.buttonIsLast,
  });

  @override
  _CellsListViewState createState() => _CellsListViewState();
}

class _CellsListViewState extends State<CellsListView> {
  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> listChildren;

    if (widget.button != null) {
      final paddedButton = Container(
        child: widget.button,
        margin: widget.buttonIsLast
            ? EdgeInsets.only(top: theme.distance.spacing.vertical.medium)
            : EdgeInsets.only(bottom: theme.distance.spacing.vertical.medium),
      );

      listChildren = widget.buttonIsLast == true
          ? [...widget.children, paddedButton]
          : [paddedButton, ...widget.children];
    } else {
      listChildren = widget.children;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.padding.horizontal.small,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(
          bottom: theme.distance.padding.vertical.medium,
        ),
        children: listChildren,
      ),
    );
  }
}
