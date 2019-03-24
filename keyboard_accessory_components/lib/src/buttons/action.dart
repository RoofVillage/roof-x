import 'package:flutter/material.dart';

typedef ContextPasser = Function(BuildContext context);

abstract class ActionKeyboardAccessoryButton extends StatelessWidget {
  Widget buildButton(
      {@required BuildContext context,
      @required Function onTap,
      @required Widget child}) {
    //Tyler, this is the thing we were talking about for expanded the button.
    return Flexible(child: GestureDetector(onTap: onTap, child: child));
  }
}
