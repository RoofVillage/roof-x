import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import '_horizontal_floating_artboard_scaffold.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class HorizontalFloatingArtboard<T> extends StatefulWidget
    with Artboard<T> {}

abstract class HorizontalFloatingArtboardState<
        T extends HorizontalFloatingArtboard> extends State<T>
    with ArtboardState<T> {
  Widget buildBody(BuildContext context);
  Widget build(BuildContext context) {
    return HorizontalFloatingArtboardScaffold(child: buildBody(context));
  }
}
