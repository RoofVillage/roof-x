import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typedefs/index.dart';

import '_mixins/button.dart';
import '../submit_button_state_option.dart';

class RoofSubmitButton extends StatefulWidget with RoofButton {
  final ContextPasser onTap;
  final String text;

  final SubmitButtonStateOption state;

  get backgroundColor => (context) {
        final theme = RoofTheme.of(context);
        switch (this.state) {
          case SubmitButtonStateOption.error:
            return theme.color.background.errorButton;
          case SubmitButtonStateOption.ready:
          case SubmitButtonStateOption.loading:
            return theme.color.background.submitButton;
        }
      };
  get borderColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.border.submitButton;
      };
  get textColor => (context) {
        final theme = RoofTheme.of(context);
        return theme.color.text.submitAction;
      };

  RoofSubmitButton(
      {@required this.onTap,
      @required this.text,
      this.state = SubmitButtonStateOption.ready});

  @override
  State<StatefulWidget> createState() => _RoofSubmitButtonState();
}

class _RoofSubmitButtonState extends State<RoofSubmitButton>
    with RoofButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  RoofButton get button => widget;
}
