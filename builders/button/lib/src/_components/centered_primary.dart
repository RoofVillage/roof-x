import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:button_status_option/index.dart';
import 'package:x_small_icon_library/index.dart';

import '_mixins/centered_button.dart';
export '_mixins/centered_button.dart';

class RoofPrimaryCenterButton extends StatefulWidget with RoofCenteredButton {
  final OnTap onTap;
  final String text;
  final ButtonStatusOption status;
  final XSmallIcon icon;

  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        switch (this.status) {
          case ButtonStatusOption.error:
            return theme.color.background.errorAction;
          case ButtonStatusOption.ready:
          case ButtonStatusOption.loading:
            return theme.color.background.primaryAction;
        }
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.primaryAction;
      };

  get iconx => XSmallIcon.add;

  RoofPrimaryCenterButton({
    @required this.onTap,
    @required this.text,
    this.icon,
    this.status = ButtonStatusOption.ready,
  });

  @override
  State<StatefulWidget> createState() => _RoofPrimaryCenterButtonState();
}

class _RoofPrimaryCenterButtonState extends State<RoofPrimaryCenterButton>
    with RoofCenteredButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofCenteredButton get button => widget;
}
