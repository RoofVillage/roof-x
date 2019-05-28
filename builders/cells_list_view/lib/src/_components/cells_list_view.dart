import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class RoofCellsListView extends StatefulWidget {
  final List<Widget> children;
  final Widget button;
  final bool reversed;

  RoofCellsListView({
    this.children,
    this.button,
    this.reversed,
  });

  @override
  _RoofCellsListViewState createState() => _RoofCellsListViewState();
}

class _RoofCellsListViewState extends State<RoofCellsListView> {
  final _spacing = distance.b;
  bool _reversed;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _reversed = widget.reversed ?? false;
    if (_reversed) WidgetsBinding.instance.addPostFrameCallback(_setInitialScroll);
  }

  void _setInitialScroll(_) {
    _controller.jumpTo(0);
  }

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

    // if (_reversed) listChildren = listChildren.reversed.toList();

    return Container(
      alignment: _reversed? Alignment(0, 1) : null,
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        reverse: _reversed? true : false,
        controller: _reversed? _controller : null,
        padding: EdgeInsets.only(bottom: distance.c),
        children: listChildren,
      ),
    );
  }
}
