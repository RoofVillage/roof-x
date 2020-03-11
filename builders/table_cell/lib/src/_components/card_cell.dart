import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

// TODO use statefulWidget to handle tapped state (like button builder)
class CardCell extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color backgroundColor;
  final Color borderColor;

  CardCell({
    @required this.child,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      onTap: () => hapticAction(
        HapticOption.light,
        action: onTap,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.medium,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.color.background.generalPrimary,
          borderRadius: BorderRadius.all(theme.radius.medium),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: child,
      ),
    );
  }
}
