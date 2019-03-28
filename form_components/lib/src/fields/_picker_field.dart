import 'package:flutter/material.dart';
import 'package:spec/index.dart';

import 'widgets/index.dart';

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

    return Container(
      padding: RoofObjectPadding.field1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rowChildren,
      ),
    );
  }
}
