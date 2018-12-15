import 'package:flutter/material.dart';
import 'package:roof/roofui_kit/roofui_color.dart';

class CellDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      decoration: BoxDecoration(color: RoofUIColor.neutralColorGradientC),
    );
  }
}
