import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class ButtonStack extends StatelessWidget {
  final List<Widget> buttons;

  ButtonStack({@required this.buttons});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> widgets = [];

    for (final button in buttons) {
      widgets.add(
        Padding(
          child: button,
          padding: EdgeInsets.only(
            top: theme.distance.spacing.vertical.small,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        left: theme.distance.padding.horizontal.small,
        right: theme.distance.padding.horizontal.small,
        bottom: theme.distance.padding.vertical.small,
      ),
      child: Column(children: widgets),
    );
  }
}
