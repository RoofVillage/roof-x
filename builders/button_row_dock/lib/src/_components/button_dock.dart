import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

class ButtonRowDock extends StatelessWidget {
  final List<Widget> buttons;

  ButtonRowDock({this.buttons});

  final _paddingSize = distance.c;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.all(_paddingSize);
    final spacer = Container(width: _paddingSize);

    List<Widget> widgets = [];

    for (var button in buttons) {
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
