import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:spec/index.dart';
import 'package:haptics/index.dart';

typedef BuildContextPasser = void Function(BuildContext context);

abstract class RoofNavButton extends StatelessWidget {
  Widget iconForTheme(RoofInheritedTheme theme);
  void onTap(BuildContext context);

  final _padding = EdgeInsets.all(RoofDistance.b);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return GestureDetector(
        onTap: (() {
          Haptic.triggerWith(HapticOption.click);
          onTap(context);
        }),
        child: Container(padding: _padding, child: iconForTheme(theme)));
  }
}
