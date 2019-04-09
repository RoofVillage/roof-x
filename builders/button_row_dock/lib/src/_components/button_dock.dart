import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class RoofButtonDock extends StatelessWidget {
  final List<Widget> buttons;

  RoofButtonDock({this.buttons});

  final _paddingSize = RoofDistance.c;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.all(_paddingSize);
    final spacer = Container(width: _paddingSize);

    List<Widget> widgets = [];

    for (var button in buttons) {
      if (button == buttons.last) {
        widgets.add(button);
      } else {
        widgets.addAll([button, spacer]);
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
