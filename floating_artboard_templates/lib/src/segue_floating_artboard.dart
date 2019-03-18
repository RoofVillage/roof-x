import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:button_components/index.dart';

import 'floating_artboard.dart';
import 'mixins/index.dart';

abstract class SegueFloatingArtboard extends FloatingArtboard {
  List<RoofTransitionButton> get buttons => [];
  String get title;

  @override
  State<StatefulWidget> createState() => _SegueFloatingArtboardState();
}

class _SegueFloatingArtboardState extends State<SegueFloatingArtboard>
    with FloatingArtboardState {
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

    for (final button in widget.buttons) {
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
