import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_mixins/left_button.dart';
export '_mixins/left_button.dart';

class RoofPrimaryLeftButton extends StatefulWidget with RoofLeftButton {
  final ContextPasser onTap;
  final String text;
  final StandardIcon iconReference;
  final bool hasArrow;

  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.secondaryAction;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.secondaryAction;
      };
  get arrowColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.icon.general;
      };

  RoofPrimaryLeftButton({
    @required this.onTap,
    @required this.text,
    this.iconReference,
    this.hasArrow = true,
  });

  @override
  State<StatefulWidget> createState() => _RoofPrimaryLeftButtonState();
}

class _RoofPrimaryLeftButtonState extends State<RoofPrimaryLeftButton>
    with RoofLeftButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofLeftButton get button => widget;
}
