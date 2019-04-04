import 'package:flutter/material.dart';
import 'package:button_stack_builder/index.dart';

import 'floating_artboard.dart';

abstract class StackFloatingArtboard extends FloatingArtboard
    with ButtonStackBuilder {
  List<Widget> get buttons;
  List<Widget> get auxiliaryButtons => [];
  String get auxiliaryText => null;

  String get title;

  @override
  State<StatefulWidget> createState() => _StackFloatingArtboardState();
}

class _StackFloatingArtboardState
    extends FloatingArtboardState<StackFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    return widget.buildButtonStack(context, buttons: widget.buttons);
  }
}
