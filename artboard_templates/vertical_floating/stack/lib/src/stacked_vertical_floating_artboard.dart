import 'package:flutter/material.dart';
import 'package:button_stack_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';

abstract class StackVerticalFloatingArtboard extends StatefulWidget
    with VerticalFloatingArtboard, Artboard, ButtonStackBuilder {
  String get title;

  List<Widget> get buttonStackButtons;

  List<Widget> buildBody(BuildContext context) => null;

  String get auxiliaryText => null;

  @override
  State<StatefulWidget> createState() => _StackVerticalFloatingArtboardState();
}

class _StackVerticalFloatingArtboardState
    extends State<StackVerticalFloatingArtboard>
    with VerticalFloatingArtboardState<StackVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    final List<Widget> children = [];

    if (widget.buildBody != null)
      children.addAll(
        widget.buildBody(context).toList(),
      );

    if (widget.buttonStackButtons != null)
      children.add(
        widget.buildButtonStack(
          context,
          widget.buttonStackButtons,
        ),
      );

    return Column(
      children: children,
    );
  }
}
