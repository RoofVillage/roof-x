import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:haptics/index.dart';

import '../input_dock.dart';

mixin AuxiliaryWidget implements StatelessWidget {
  StandardIconReference get iconReference;

  action(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.icon.general;
    final icon = iconReference.buildSvg(color: iconColor);

    final baseHeight = RoofInputDock.of(context).baseHeight;

    return GestureDetector(
      onTap: () => _onTap(context),
      child: Container(
        height: baseHeight,
        margin: EdgeInsets.only(right: distance.c),
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  _onTap(BuildContext context) {
    triggerHapticWith(HapticOption.medium);
    action(context);
  }
}
