import 'package:flutter/material.dart';

import '_widgets/index.dart';

class RoofPickerField extends StatelessWidget {
  final String name;
  final Widget fieldBody;

  RoofPickerField({this.name, this.fieldBody});

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];

    if (name != null) {
      final label = RoofFieldLabel(labelText: name);
      rowChildren.add(label);
    }

    rowChildren.add(fieldBody);

    return RoofFieldContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rowChildren,
      ),
    );
  }
}
