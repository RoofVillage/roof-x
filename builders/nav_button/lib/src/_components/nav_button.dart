import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:typedefs/index.dart';

mixin NavButton implements StatelessWidget {
  ContextPasser get onTap;

  Widget iconForTheme(SemanticInheritedTheme theme);

  final _tapHapticOption = HapticOption.light;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: () => onTap(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.small,
          vertical: theme.distance.padding.vertical.small,
        ),
        child: iconForTheme(theme),
      ),
    );
  }

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }
}
