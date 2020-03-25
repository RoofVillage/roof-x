import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

mixin ActionKeyboardAccessoryButton implements StatelessWidget {
  String get title;
  void Function() get onTap;

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  Widget buildButton({
    @required BuildContext context,
    @required void Function() onTap,
    @required Widget child,
    Color backgroundColor,
  }) {
    final theme = SemanticTheme.of(context);

    return Expanded(
      child: GestureDetector(
        onTapDown: (details) => _fireHaptic(),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.color.background.raised,
            boxShadow: [theme.shadow.small],
          ),
          child: Container(
            child: child,
            padding: EdgeInsets.symmetric(
              vertical: theme.distance.padding.vertical.medium,
            ),
            color: backgroundColor ?? theme.color.background.general,
          ),
        ),
      ),
    );
  }
}
