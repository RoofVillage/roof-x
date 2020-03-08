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
          horizontal: theme.distance.gutter.horizontal.medium,
          vertical: theme.distance.gutter.vertical.medium,
        ),
        child: child,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.color.stroke.light),
          ),
        ),
      ),
    );
  }
}
