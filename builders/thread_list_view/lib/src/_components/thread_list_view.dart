import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class RoofThreadListView extends StatefulWidget {
  final List<Widget> children;
  final Widget button;

  RoofThreadListView({
    this.children,
    this.button,
  });

  @override
  _RoofThreadListViewState createState() => _RoofThreadListViewState();
}

class _RoofThreadListViewState extends State<RoofThreadListView> {
  final _spacing = distance.b;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_setInitialScroll);
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

    return Container(
      alignment: Alignment(0, 1),
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        reverse: true,
        controller: _controller,
        padding: EdgeInsets.only(bottom: distance.c),
        children: listChildren,
      ),
    );
  }
}
