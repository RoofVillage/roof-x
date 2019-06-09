import 'package:flutter/material.dart';

class CellSpacedRow extends StatelessWidget {
  final List<Widget> children;

  CellSpacedRow({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: children,
    );
  }
}
