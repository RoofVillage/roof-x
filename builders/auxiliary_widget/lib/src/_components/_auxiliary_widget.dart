import 'package:flutter/material.dart';
import 'package:input_dock_builder/index.dart';
import 'package:distance/index.dart' as distance;

class AuxiliaryWidget extends StatelessWidget {
  final Widget child;

  AuxiliaryWidget({this.child});

  @override
  Widget build(BuildContext context) {
    final baseHeight = RoofInputDock.of(context).baseHeight;

    return Container(
      height: baseHeight,
      margin: EdgeInsets.only(right: distance.c),
      child: Center(
        child: child,
      ),
    );
  }
}
