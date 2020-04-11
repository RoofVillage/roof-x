import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

mixin NavButton implements StatelessWidget {
  void Function() get onTap;

  Widget buildIcon(BuildContext context) => null;

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
          horizontal: theme.distance.padding.horizontal.small,
          vertical: theme.distance.padding.vertical.small,
        ),
        child: buildIcon(context),
      ),
    );
  }
}
