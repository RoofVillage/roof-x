import 'package:flutter/material.dart';

typedef ContextPasser = Function(BuildContext context);

abstract class ActionKeyboardAccessoryButton extends StatelessWidget {
  Widget buildButton(
      {@required BuildContext context,
      @required Function onTap,
      @required Widget child}) {
    return Expanded(child: GestureDetector(onTap: onTap, child: child));
  }
}
