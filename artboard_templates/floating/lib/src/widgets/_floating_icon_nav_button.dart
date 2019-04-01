import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:spec/index.dart';

typedef BuildContextPasser = void Function(BuildContext context);

class FloatingIconNavButton extends StatelessWidget {
  final NavigationIconReference iconReference;
  final BuildContextPasser onTap;

  final _padding = EdgeInsets.all(RoofDistance.b);

  FloatingIconNavButton({@required this.iconReference, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final icon =
        iconReference.buildSvg(color: theme.color.icon.transitionAction);

    return GestureDetector(
        onTap: () => _onTap(context),
        child: Container(padding: _padding, child: icon));
  }

  void _onTap(BuildContext context) {
    triggerHapticWith(HapticOption.click);
    onTap(context);
  }
}
