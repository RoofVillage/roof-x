import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

mixin VerticalFullScreenArtboard implements StatefulWidget, Artboard {
  Widget buildBody(BuildContext context);
  Widget buildNavBar(BuildContext context) => null;
  Widget buildDock(BuildContext context) => null;

  @override
  State<StatefulWidget> createState() => _VerticalFullScreenArtboardState();
}

mixin VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    implements State<T> {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final navBar = widget.buildNavBar(context);
    final body = widget.buildBody(context);
    final dock = widget.buildDock(context);

    final children = <Widget>[];

    if (navBar != null) children.add(navBar);

    final stretchedBody = Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: false,
        child: body,
      ),
    );

    children.add(stretchedBody);
    if (dock != null) children.add(dock);

    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

    final scaffold = Scaffold(
      backgroundColor: theme.color.background.generalSecondary,
      body: SafeArea(
        child: column,
      ),
    );

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    extends State<T> with VerticalFullScreenArtboardState<T> {}
