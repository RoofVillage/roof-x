import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';
import 'package:haptics/index.dart';

import '../input_dock.dart';

class AuxiliaryWidget extends StatelessWidget {
  final StandardIconReference iconReference;
  final Function(BuildContext) action;

  AuxiliaryWidget({
    this.iconReference,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.icon.general;
    final icon = iconReference.buildSvg(color: iconColor);

    final baseHeight = RoofInputDock.of(context).baseHeight;

    onTap() {
      Haptic.triggerWith(HapticOption.medium);
      action(context);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: baseHeight,
        margin: EdgeInsets.only(right: RoofDistance.c),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
