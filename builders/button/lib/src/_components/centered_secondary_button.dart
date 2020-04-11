import 'package:flutter/material.dart';
import 'package:button_builder/src/types/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tappable/index.dart';
import 'package:vertically_centered_text_builder/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:button_status_option/index.dart';

import '_mixins/centered_button.dart';
export '_mixins/centered_button.dart';

class SecondaryCenterButton extends StatefulWidget with CenteredStyleButton {
  final OnTap onTap;
  final String text;
  final XSmallIcon icon;
  final ButtonStatusOption status;

  get backgroundColor => (context) {
        return SemanticTheme.of(context).color.background.actionSecondary;
      };

  get textColor => (context) {
        final theme = SemanticTheme.of(context);

        switch (this.status) {
          case ButtonStatusOption.error:
            return theme.color.text.warn;
          case ButtonStatusOption.ready:
          case ButtonStatusOption.loading:
            return theme.color.text.onActionSecondaryBackground;
        }
        return null;
      };

  get strokeColor => (context) {
        return SemanticTheme.of(context).color.stroke.actionSecondary;
      };

  SecondaryCenterButton({
    @required this.onTap,
    @required this.text,
    this.icon,
    status,
  }) : this.status = status ?? ButtonStatusOption.ready;

  @override
  State<StatefulWidget> createState() => _SecondaryCenterButton();
}

class _SecondaryCenterButton extends State<SecondaryCenterButton>
    with VerticallyCenteredTextBuilder, Tappable, CenteredStyleButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  CenteredStyleButton get button => widget;
}
