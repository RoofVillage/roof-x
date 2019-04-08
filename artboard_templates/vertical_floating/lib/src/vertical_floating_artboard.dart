import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'navigation/button_option.dart';
import '_vertical_floating_artboard_scaffold.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class VerticalFloatingArtboard<T> extends StatefulWidget
    with Artboard<T> {
  VerticalFloatingArtboardButtonOption get navButtonOption => null;
}

abstract class VerticalFloatingArtboardState<T extends VerticalFloatingArtboard>
    extends State<T> with ArtboardState<T> {
  Widget buildBody(BuildContext context);
  Widget build(BuildContext context) {
    final child = buildBody(context);

    return VerticalFloatingArtboardScaffold(child: child);
  }
}
