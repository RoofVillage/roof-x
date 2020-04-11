import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:button_status_option/index.dart';
import 'package:vertically_centered_text_builder/index.dart';
import 'package:tappable/index.dart';
import 'package:x_small_icon_library/index.dart';

import '_mixins/centered_button.dart';

class PrimaryCenterButton extends StatefulWidget with CenteredStyleButton {
  final OnTap onTap;
  final String text;
  final ButtonStatusOption status;
  final XSmallIcon icon;

  get backgroundColor => (context) {
        final theme = SemanticTheme.of(context);

        switch (this.status) {
          case ButtonStatusOption.error:
            return theme.color.background.warn;
          case ButtonStatusOption.ready:
          case ButtonStatusOption.loading:
            return theme.color.background.actionPrimary;
        }

        return null;
      };

  get textColor => (context) {
        return SemanticTheme.of(context).color.text.onActionPrimaryBackground;
      };

  get strokeColor => (context) {
        return SemanticTheme.of(context).color.stroke.actionPrimary;
      };

  PrimaryCenterButton({
    @required this.onTap,
    @required this.text,
    this.icon,
    ButtonStatusOption status,
  }) : this.status = status ?? ButtonStatusOption.ready;

  @override
  State<StatefulWidget> createState() => _PrimaryCenterButtonState();
}

class _PrimaryCenterButtonState extends State<PrimaryCenterButton>
    with
        VerticallyCenteredTextBuilder,
        Tappable<PrimaryCenterButton>,
        CenteredStyleButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  CenteredStyleButton get button => widget;
}
