import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import '_scaffold.dart';

mixin HorizontalFloatingArtboard<T> implements StatefulWidget, Artboard<T> {}

mixin HorizontalFloatingArtboardState<T extends HorizontalFloatingArtboard>
    implements State<T>, ArtboardState<T> {
  Widget buildBody(BuildContext context);
  Widget build(BuildContext context) {
    return HorizontalFloatingArtboardScaffold(child: buildBody(context));
  }
}
