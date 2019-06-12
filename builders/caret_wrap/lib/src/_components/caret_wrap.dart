import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:distance/index.dart' as distance;

class CaretWrap extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onTap;

  CaretWrap({
    this.children,
    this.onTap,
  });

  final _verticalMargin = distance.c;
  final _verticalSpacing = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final paddedArrowWidget = Container(
      margin: EdgeInsets.only(left: distance.a),
      child: XSmallIcon.rightArrow.buildWidget(
        color: theme.color.icon.secondary,
      ),
    );

    List<Widget> wrapChildren = [];

    for (int i = 0; i < children.length; i++) {
      List<Widget> rowChildren = [];

      rowChildren.add(children[i]);

      if (i < children.length - 1) {
        rowChildren.add(paddedArrowWidget);
      }

      wrapChildren.add(
        Row(
          children: rowChildren,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        ),
      );
    }

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: _verticalMargin),
        child: Wrap(
          runSpacing: _verticalSpacing,
          children: wrapChildren,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ),
    );
  }
}
