import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

import '_scaffold.dart';

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

    final body = VerticalFullScreenScaffold(
      navBar: widget.buildNavBar(context),
      body: widget.buildBody(context),
      dock: widget.buildDock(context),
    );

    final scaffold = Scaffold(
      backgroundColor: theme.color.background.general,
      body: body,
    );

    return RoofTheme(theme.current, child: scaffold);
  }
}

class _VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    extends State<T> with VerticalFullScreenArtboardState<T> {}
