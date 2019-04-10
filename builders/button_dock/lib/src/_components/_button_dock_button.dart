import 'package:flutter/material.dart';

import 'package:corner_radius/index.dart' as corner_radius;

class ButtonDockButton extends StatelessWidget {
  final String title;
  final Function action;
  final TextStyle textStyle;
  final Color buttonColor;

  ButtonDockButton({
    this.title,
    this.action,
    this.textStyle,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: action,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(corner_radius.regular)),
          child: Center(
            child: Text(
              title,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
