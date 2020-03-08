import 'package:flutter/material.dart';
import 'package:vertical_spaced_column_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';

abstract class StackVerticalFloatingArtboard extends StatefulWidget
    with VerticalFloatingArtboard, Artboard, VerticalSpacedColumnBuilder {
  String get title;

  List<Widget> Function(BuildContext) get buildStandardButtonStackButtons;

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

    if (widget.buildStandardButtonStackButtons != null)
      children.add(
        widget.buildVerticalSpacedColumn(
          context,
          children: widget.buildStandardButtonStackButtons(context),
        ),
      );

    return Column(
      children: children,
    );
  }
}
