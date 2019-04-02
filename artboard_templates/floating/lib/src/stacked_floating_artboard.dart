import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

import 'floating_artboard.dart';

abstract class StackFloatingArtboard extends StatefulWidget
    with Artboard, FloatingArtboard {
  List<Widget> get stackedWidgets => [];
  String get title;

  @override
  State<StatefulWidget> createState() => _StackFloatingArtboardState();
}

class _StackFloatingArtboardState extends State<StackFloatingArtboard>
    with
        ArtboardState<StackFloatingArtboard>,
        FloatingArtboardState<StackFloatingArtboard> {
  final _headerStyle = RoofTypography.heading2;
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> children = [];

    if (widget.title != null)
      children.add(
        Text(
          widget.title,
          style: _headerStyle.textStyleWithColor(theme.color.text.primary),
        ),
      );

    for (final button in widget.stackedWidgets) {
      children.add(
        Padding(
          child: button,
          padding: _buttonVerticalPadding,
        ),
      );
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
