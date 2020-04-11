import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertically_centered_text_builder/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:tappable/index.dart';
import 'package:typedefs/index.dart';

import '_mixins/left_button.dart';
export '_mixins/left_button.dart';

class SecondaryLeftButton extends StatefulWidget with LeftStyleButton {
  final ContextPasser onTap;
  final String text;
  final StandardIcon iconReference;
  final bool hasArrow;

  get backgroundColor => (context) {
        return SemanticTheme.of(context).color.background.actionSecondary;
      };

  get textColor => (context) {
        return SemanticTheme.of(context).color.text.onActionSecondaryBackground;
      };

  get arrowColor => (context) {
        return SemanticTheme.of(context).color.icon.generalSecondary;
      };

  SecondaryLeftButton({
    @required this.onTap,
    @required this.text,
    this.iconReference,
    this.hasArrow = true,
  });

  @override
  State<StatefulWidget> createState() => _SecondaryLeftButtonState();
}

class _SecondaryLeftButtonState extends State<SecondaryLeftButton>
    with VerticallyCenteredTextBuilder, Tappable, LeftButtonState {
  @override
  Widget build(BuildContext context) => buildButton(context);

  @override
  LeftStyleButton get button => widget;
}
