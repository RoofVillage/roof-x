import 'package:flutter/material.dart';
import 'package:spec/index.dart';

import 'widgets/field_label.dart';

class RoofPickerField extends StatelessWidget {
  final String fieldName;
  final Widget body;

  final double _fieldHeight = 40;

  RoofPickerField({@required this.fieldName, this.body});

  @override
  Widget build(BuildContext context) {
    final label = RoofFieldLabel(labelText: fieldName);
    final fieldChildren = [label, body];

    return Container(
        height: _fieldHeight,
        padding: RoofObjectPadding.field1,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: fieldChildren)
        ]));
  }
}
