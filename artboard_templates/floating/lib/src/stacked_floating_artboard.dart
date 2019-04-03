import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'floating_artboard.dart';

abstract class StackFloatingArtboard extends FloatingArtboard {
  List<Widget> get stackedWidgets => [];
  String get title;

  @override
  State<StatefulWidget> createState() => _StackFloatingArtboardState();
}

class _StackFloatingArtboardState
    extends FloatingArtboardState<StackFloatingArtboard> {
  final _headerStyle = RoofTypography.heading2;
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  @override
  Widget buildBody(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> widgets = [];

    if (widget.title != null)
      widgets.add(
        Text(
          widget.title,
          style: _headerStyle.textStyleWithColor(theme.color.text.primary),
        ),
      );

    for (final button in widget.stackedWidgets) {
      widgets.add(
        Padding(
          child: button,
          padding: _buttonVerticalPadding,
        ),
      );
    }

    return Column(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
