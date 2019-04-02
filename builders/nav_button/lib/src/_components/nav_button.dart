import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:spec/index.dart';
import 'package:haptics/index.dart';

typedef BuildContextPasser = void Function(BuildContext context);

mixin RoofNavButton implements StatelessWidget {
  BuildContextPasser get onTap;

  Widget iconForTheme(RoofInheritedTheme theme);

  final _padding = EdgeInsets.all(RoofDistance.b);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return GestureDetector(
        onTap: () => _onTap(context),
        child: Container(padding: _padding, child: iconForTheme(theme)));
  }

  void _onTap(BuildContext context) {
    triggerHapticWith(HapticOption.click);
    onTap(context);
  }
}
