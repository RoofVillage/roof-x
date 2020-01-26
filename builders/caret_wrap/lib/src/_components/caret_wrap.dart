import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:haptics/index.dart';

class CaretWrap extends StatelessWidget {
  final List<Widget> children;
  final VoidCallback onTap;

  CaretWrap({
    this.children,
    this.onTap,
  });

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final paddedArrowWidget = Container(
      margin: EdgeInsets.only(
        left: theme.distance.spacing.horizontal.min,
      ),
      child: XSmallIcon.rightArrow.buildWidget(
        color: theme.color.icon.generalSecondary,
      ),
    );

    List<Widget> wrapChildren = [];

    for (Widget child in children) {
      List<Widget> rowChildren = [];

      rowChildren.add(child);

      if (child != children.last) {
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
      child: Wrap(
        runSpacing: theme.distance.padding.vertical.small,
        children: wrapChildren,
        crossAxisAlignment: WrapCrossAlignment.center,
      ),
    );
  }
}
