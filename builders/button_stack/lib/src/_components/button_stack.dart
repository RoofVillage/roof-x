import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

class RoofButtonStack extends StatelessWidget {
  final List<Widget> buttons;

  RoofButtonStack({@required this.buttons});

  final padding = distance.d;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    for (final button in buttons) {
      widgets.add(
        Padding(
          child: button,
          padding: EdgeInsets.only(top: padding),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        bottom: padding,
      ),
      child: Column(children: widgets),
    );
  }
}
