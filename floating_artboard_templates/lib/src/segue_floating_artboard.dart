import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:button_components/index.dart';

import 'floating_artboard.dart';

abstract class SegueFloatingArtboard extends FloatingArtboard {
  List<RoofTransitionButton> get buttons => [];

  String get title;

  final _headerStyle = RoofTypography.heading2;

  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> children = [];

    if (title != null)
      children.add(
        Text(
          title,
          style: _headerStyle.textStyleWithColor(theme.color.text.primary),
        ),
      );

    for (final button in buttons) {
      children.add(
        Padding(
          child: button,
          padding: _buttonVerticalPadding,
        ),
      );
    }

    return children;
  }
}
