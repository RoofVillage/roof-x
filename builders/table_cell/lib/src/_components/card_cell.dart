import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

class CardCell extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  CardCell({
    @required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      onTap: () => triggerHaptic(
        HapticOption.light,
        and: onTap,
      ),
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
