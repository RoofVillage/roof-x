import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class ButtonRowDock extends StatelessWidget {
  final List<Widget> buttons;

  ButtonRowDock({this.buttons});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);
    final padding = EdgeInsets.symmetric(
      horizontal: theme.distance.padding.horizontal.medium,
      vertical: theme.distance.padding.vertical.medium,
    );
    final spacer = Container(
      width: theme.distance.spacing.horizontal.medium,
    );

    List<Widget> widgets = [];

    for (Widget button in buttons) {
      if (button == buttons.last) {
        widgets.add(
          Expanded(child: button),
        );
      } else {
        widgets.addAll(
          [
            Expanded(child: button),
            spacer,
          ],
        );
      }
    }

    return Container(
      padding: padding,
      child: Row(
        children: widgets,
      ),
    );
  }
}
