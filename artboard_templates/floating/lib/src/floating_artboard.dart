import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'navigation/button_option.dart';
import '_scaffolds/floating_artboard_container.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);
mixin FloatingArtboard<T> implements Artboard<T> {
  FloatingArtboardButtonOption get navButtonOption => null;
}

mixin FloatingArtboardState<T extends FloatingArtboard>
    implements ArtboardState<T> {
  Widget buildBody(BuildContext context);

  Widget build(BuildContext context) {
    final child = buildBody(context);

    return FloatingArtboardContainer(child: child);
  }
}
