import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

abstract class VerticalFullScreenArtboard extends StatefulWidget with Artboard {
  Widget buildBody(BuildContext context);

  @override
  State<StatefulWidget> createState() => VerticalFullScreenArtboardState();
}

class VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    extends State<T> {
  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        backgroundColor: theme.color.background.general,
        body: widget.buildBody(context));

    return RoofTheme(theme.current, child: scaffold);
  }
}
