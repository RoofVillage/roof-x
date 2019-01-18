import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_color.dart';

class CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(color: RoofUIColor.neutralColorC),
    );
  }
}
