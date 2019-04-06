import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import '_clock_type.dart';

class ClockTypeRollerColumn extends StatelessWidget {
  final ClockType selectedClockType;
  final double stepHeight;

  ClockTypeRollerColumn({
    this.selectedClockType,
    this.stepHeight,
  });

  final _inactiveTypography = RoofTypography.bodyPrimary;
  final _activeTypography = RoofTypography.bodyPrimaryThick;

  @override
  Widget build(BuildContext context) {
    final activeTextColor = RoofTheme.of(context).color.text.primary;
    final inactiveTextColor = RoofTheme.of(context).color.text.secondary;
    final activeStyle = _activeTypography.textStyleWithColor(activeTextColor);
    final inactiveStyle =
        _inactiveTypography.textStyleWithColor(inactiveTextColor);

    List<Widget> widgets = [];

    final Widget amBlock = Container(
      height: stepHeight,
      child: Center(
        child: Text(
          "am",
          style:
              selectedClockType == ClockType.am ? activeStyle : inactiveStyle,
        ),
      ),
    );

    final Widget pmBlock = Container(
      height: stepHeight,
      child: Center(
        child: Text(
          "pm",
          style:
              selectedClockType == ClockType.pm ? activeStyle : inactiveStyle,
        ),
      ),
    );

    widgets.addAll([amBlock, pmBlock]);

    return Container(
      height: widgets.length * stepHeight,
      child: Column(children: widgets),
    );
  }
}