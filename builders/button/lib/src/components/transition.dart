import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'mixins/index.dart';
import 'package:icon_library/index.dart';

class RoofTransitionButton extends StatefulWidget with RoofButton {
  final OnTap onTap;
  final String text;
  final StandardIconReference iconReference;

  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.transitionButton;
      };
  get borderColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.border.transitionButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.transitionAction;
      };

  RoofTransitionButton(
      {@required this.onTap, @required this.text, this.iconReference});

  @override
  State<StatefulWidget> createState() => _RoofTransitionButtonState();
}

class _RoofTransitionButtonState extends State<RoofTransitionButton>
    with RoofButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofButton get button => widget;
}
