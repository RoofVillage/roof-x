import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'navigation/button_option.dart';
import '_scaffolds/floating_artboard_container.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class FloatingArtboard<T> extends StatefulWidget with Artboard<T> {
  FloatingArtboardButtonOption get navButtonOption => null;
}

abstract class FloatingArtboardState<T extends FloatingArtboard>
    extends State<T> with ArtboardState<T> {
  Widget buildBody(BuildContext context);
  Widget build(BuildContext context) { 
    return FloatingArtboardContainer(child: buildBody(context));
  }
}
