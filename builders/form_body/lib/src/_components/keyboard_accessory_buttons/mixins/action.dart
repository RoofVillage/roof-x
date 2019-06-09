import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';

mixin ActionKeyboardAccessoryButton implements StatelessWidget {
  String get title;
  ContextPasser get onTap;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  Widget buildButton({
    @required BuildContext context,
    @required Function onTap,
    @required Widget child,
  }) {
    return Expanded(
      child: GestureDetector(
        onTapDown: (details) => _fireHaptic(),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
