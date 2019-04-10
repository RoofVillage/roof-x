import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';

mixin RoofNavButton implements StatelessWidget {
  ContextPasser get onTap;

  Widget iconForTheme(RoofInheritedTheme theme);

  final _padding = EdgeInsets.all(distance.b);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return GestureDetector(
        onTap: () => _onTap(context),
        child: Container(
          padding: _padding,
          child: iconForTheme(theme),
        ));
  }

  void _onTap(BuildContext context) {
    triggerHapticWith(HapticOption.click);
    onTap(context);
  }
}
