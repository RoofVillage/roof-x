import 'package:flutter/material.dart';
import 'package:button_builder/src/types/index.dart';
import 'package:theme/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:button_status_option/index.dart';

import '_mixins/centered_button.dart';
export '_mixins/centered_button.dart';

class RoofSecondaryCenterButton extends StatefulWidget with RoofCenteredButton {
  final OnTap onTap;
  final String text;
  final XSmallIcon icon;
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
        return null;
      };
  
  get strokeColor => (context) {
    final theme = RoofTheme.of(context);
    return theme.color.stroke.secondaryAction;
  };

  RoofSecondaryCenterButton({
    @required this.onTap,
    @required this.text,
    this.icon,
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
