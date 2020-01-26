import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'button_stack.dart';

class TitledButtonStack extends StatelessWidget {
  final List<Widget> buttons;
  final String title;

  TitledButtonStack({@required this.title, @required this.buttons});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> widgets = [];
    widgets.add(
      Text(
        title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      ),
    );

    final buttonStack = ButtonStack(buttons: buttons);

    widgets.add(buttonStack);
    return Column(children: widgets);
  }
}
