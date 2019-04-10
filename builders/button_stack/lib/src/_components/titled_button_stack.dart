import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

import 'button_stack.dart';

class RoofTitledButtonStack extends StatelessWidget {
  final List<Widget> buttons;
  final String title;

  RoofTitledButtonStack({@required this.title, @required this.buttons});

  final _titleStyle = typography.heading2;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final List<Widget> widgets = [];
    widgets.add(
      Text(
        title,
        style: _titleStyle.textStyleWithColor(theme.color.text.primary),
      ),
    );
    final buttonStack = RoofButtonStack(buttons: buttons);

    widgets.add(buttonStack);
    return Column(children: widgets);
  }
}
