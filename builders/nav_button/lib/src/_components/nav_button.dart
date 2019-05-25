import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';
import 'package:distance/index.dart' as distance;

mixin RoofNavButton implements StatelessWidget {
  ContextPasser get onTap;

  Widget iconForTheme(RoofInheritedTheme theme);

  final _padding = EdgeInsets.all(distance.b);

  final _tapHapticOption = HapticOption.light;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: () => onTap(context),
      child: Container(
        padding: _padding,
        child: iconForTheme(theme),
      ),
    );
  }

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }
}
