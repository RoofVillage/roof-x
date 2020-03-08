import 'package:flutter/material.dart';
import 'package:spaced_column_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';

abstract class SpacedColumnVerticalFloatingArtboard extends StatefulWidget
    with VerticalFloatingArtboard, Artboard, SpacedColumnBuilder {
  String get title;

  List<Widget> Function(BuildContext) get buildStandardButtonStackButtons;

  List<Widget> buildBody(BuildContext context) => null;

  String get auxiliaryText => null;

  @override
  State<StatefulWidget> createState() => _SpacedColumnVerticalFloatingArtboardState();
}

class _SpacedColumnVerticalFloatingArtboardState
    extends State<SpacedColumnVerticalFloatingArtboard>
    with VerticalFloatingArtboardState<SpacedColumnVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    final List<Widget> children = [];

    if (widget.buildBody(context) != null)
      children.addAll(
        widget.buildBody(context).toList(),
      );

    if (widget.buildStandardButtonStackButtons != null)
      children.add(
        widget.buildSpacedColumn(
          context,
          children: widget.buildStandardButtonStackButtons(context),
        ),
      );

    return Column(
      children: children,
    );
  }
}
