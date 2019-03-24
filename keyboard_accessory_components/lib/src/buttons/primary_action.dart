import 'package:flutter/material.dart';

import 'action.dart';

class PrimaryActionKeyboardAccessoryButton
    extends ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  PrimaryActionKeyboardAccessoryButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildButton(
        context: context,
        onTap: () => onTap(context),
        child: Container(color: Colors.pink, child: Text(title)));
  }
}
