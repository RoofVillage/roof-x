import 'package:flutter/material.dart';
import 'package:button_stack_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';

abstract class StackVerticalFloatingArtboard extends StatefulWidget
    with VerticalFloatingArtboard, Artboard, ButtonStackBuilder {
  List<Widget> buildBody(BuildContext context) => null;
  List<Widget> buildButtons(BuildContext context);
  String get auxiliaryText => null;

  String get title;

  @override
  State<StatefulWidget> createState() => _StackVerticalFloatingArtboardState();
}

class _StackVerticalFloatingArtboardState
    extends State<StackVerticalFloatingArtboard>
    with VerticalFloatingArtboardState<StackVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    return widget.buildButtonStack(context);
  }
}
