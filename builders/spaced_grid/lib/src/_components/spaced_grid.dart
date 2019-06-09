import 'package:flutter/material.dart';

class SpacedGrid extends StatelessWidget {
  final List<Widget> children;
  final double horizontalSpacing;
  final double verticalSpacing;

  SpacedGrid({
    @required this.children,
    this.horizontalSpacing = 0,
    this.verticalSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> paddedObjects = [];

    for (Widget child in children) {
      paddedObjects.add(
        Padding(
          padding: EdgeInsets.only(
            top: verticalSpacing?? 0,
            right: horizontalSpacing?? 0,
          ),
          child: child,
        ),
      );
    }

    return Wrap(
      children: paddedObjects,
    );
  }
}
