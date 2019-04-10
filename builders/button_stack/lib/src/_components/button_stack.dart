import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

class RoofButtonStack extends StatelessWidget {
  final List<Widget> buttons;

  RoofButtonStack({@required this.buttons});

  final _buttonVerticalPadding = EdgeInsets.only(top: distance.d);
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    for (final button in buttons) {
      widgets.add(
        Padding(
          child: button,
          padding: _buttonVerticalPadding,
        ),
      );
    }

    return Column(children: widgets);
  }
}
