import 'package:flutter/material.dart';

typedef ContextPasser = Function(BuildContext context);

mixin ActionKeyboardAccessoryButton implements StatelessWidget {
  String get title;
  ContextPasser get onTap;

  Widget buildButton(
      {@required BuildContext context,
      @required Function onTap,
      @required Widget child}) {
    return Expanded(child: GestureDetector(onTap: onTap, child: child));
  }
}
