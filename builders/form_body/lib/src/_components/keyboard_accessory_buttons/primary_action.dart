import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typedefs/index.dart';
import 'package:typography/index.dart' as typography;

import 'mixins/index.dart';

class PrimaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  PrimaryActionKeyboardAccessoryButton(
      {@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle =
        typography.button.textStyleWithColor(theme.color.text.primaryAction);

    return buildButton(
      context: context,
      onTap: () => onTap(context),
      child: Container(
        color: theme.color.background.primaryAction,
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
