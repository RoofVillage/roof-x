import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';

import '_mixins/centered_button.dart';
export '_mixins/centered_button.dart';
import '../button_status_option.dart';

class RoofPrimaryCenteredButton extends StatefulWidget with RoofCenteredButton {
  final OnTap onTap;
  final String text;
  final StandardIconReference iconReference;
  final ButtonStatusOption status;

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

  RoofPrimaryCenteredButton({
    @required this.onTap,
    @required this.text,
    this.iconReference,
    this.status = ButtonStatusOption.ready,
  });

  @override
  State<StatefulWidget> createState() => _RoofPrimaryCenteredButtonState();
}

class _RoofPrimaryCenteredButtonState extends State<RoofPrimaryCenteredButton>
    with RoofButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofCenteredButton get button => widget;
}
