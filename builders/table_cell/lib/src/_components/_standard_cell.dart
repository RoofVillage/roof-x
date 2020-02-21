import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

class StandardCell extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  StandardCell({
    @required this.child,
    this.onTap,
  });

  final _tapHapticOption = HapticOption.light;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      onTap: () => onTap,
      onTapDown: (_) => triggerHapticWith(_tapHapticOption),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.medium,
        ),
        decoration: BoxDecoration(
          color: theme.color.background.generalPrimary,
          borderRadius: BorderRadius.all(theme.radius.medium),
        ),
        child: child,
      ),
    );
  }
}
