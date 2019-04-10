import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import '_mixins/centered_button.dart';
export '_mixins/centered_button.dart';
import '../button_status_option.dart';

class RoofSecondaryCenterButton extends StatefulWidget
    with RoofCenteredButton {
  final OnTap onTap;
  final String text;
  final ButtonStatusOption status;

  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.background.secondaryAction;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        switch (this.status) {
          case ButtonStatusOption.error:
            return theme.color.text.alert;
          case ButtonStatusOption.ready:
          case ButtonStatusOption.loading:
            return theme.color.text.secondaryAction;
        }
      };

  RoofSecondaryCenterButton({
    @required this.onTap,
    @required this.text,
    this.status = ButtonStatusOption.ready,
  });

  @override
  State<StatefulWidget> createState() => _RoofSecondaryCenterButton();
}

class _RoofSecondaryCenterButton extends State<RoofSecondaryCenterButton>
    with RoofCenteredButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofCenteredButton get button => widget;
}
