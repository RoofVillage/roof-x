import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

mixin NavButton implements StatelessWidget {
  void Function() get onTap;

  Widget buildIcon(BuildContext context) => null;

  final _tapHapticOption = HapticOption.light;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      onTap: () => triggerHaptic(
        _tapHapticOption,
        and: onTap,
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
