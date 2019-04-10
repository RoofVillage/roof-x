import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

import '_scaffold.dart';

mixin VerticalFloatingArtboard<T> implements StatefulWidget, Artboard<T> {
  VerticalFloatingArtboardButtonOption get navButtonOption => null;
}

mixin VerticalFloatingArtboardState<T extends VerticalFloatingArtboard>
    implements State<T>, ArtboardState<T> {
  Widget buildBody(BuildContext context);
  Widget build(BuildContext context) {
    return VerticalFloatingArtboardScaffold(child: buildBody(context));
  }
}
