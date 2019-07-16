import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:haptics/index.dart';

import '_widgets/index.dart';

class RoofPickerField extends StatelessWidget {
  final String name;
  final Widget fieldBody;
  final VoidCallback onTap;

  RoofPickerField({
    this.name,
    this.fieldBody,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];

    if (name != null) {
      final label = RoofFieldLabel(labelText: name);
      final spacer = Container(width: distance.b);
      rowChildren.addAll([label, spacer]);
    }

    final tapTarget = Expanded(
      child: GestureDetector(
        child: Container(
          alignment: Alignment(1, 0),
          child: fieldBody,
        ),
        onTap: onTap,
        onTapDown: (details) => triggerHapticWith(HapticOption.light),
        behavior: HitTestBehavior.opaque,
      ),
    );

    rowChildren.add(tapTarget);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowChildren,
      ),
    );
  }
}
