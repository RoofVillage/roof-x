import 'package:flutter/material.dart';

import 'action.dart';

class SecondaryActionKeyboardAccessoryButton
    extends ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  SecondaryActionKeyboardAccessoryButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildButton(
        context: context,
        onTap: () => onTap(context),
        child: Container(color: Colors.amber, child: Text(title)));
  }
}
