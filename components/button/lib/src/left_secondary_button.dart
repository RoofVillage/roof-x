import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_mixins/left_button.dart';
export '_mixins/left_button.dart';

class RoofSecondaryLeftButton extends StatefulWidget with RoofLeftButton {
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
        return theme.color.text.secondary;
      };
  get arrowColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.icon.general;
      };

  RoofSecondaryLeftButton({
    @required this.onTap,
    @required this.text,
    this.iconReference,
    this.hasArrow = true,
  });

  @override
  State<StatefulWidget> createState() => _RoofSecondaryLeftButtonState();
}

class _RoofSecondaryLeftButtonState extends State<RoofSecondaryLeftButton>
    with RoofLeftButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofLeftButton get button => widget;
}
