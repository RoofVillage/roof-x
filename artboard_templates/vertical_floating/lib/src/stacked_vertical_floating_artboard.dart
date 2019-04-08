import 'package:flutter/material.dart';
import 'package:button_stack_builder/index.dart';

import 'vertical_floating_artboard.dart';

abstract class StackVerticalFloatingArtboard extends VerticalFloatingArtboard
    with ButtonStackBuilder {
  List<Widget> get buttons;
  List<Widget> get auxiliaryButtons => [];
  String get auxiliaryText => null;

  String get title;

  @override
  State<StatefulWidget> createState() => _StackVerticalFloatingArtboardState();
}

class _StackVerticalFloatingArtboardState
    extends VerticalFloatingArtboardState<StackVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    return widget.buildButtonStack(context, buttons: widget.buttons);
  }
}
