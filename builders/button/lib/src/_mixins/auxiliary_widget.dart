import 'package:flutter/material.dart';
import 'package:input_dock_builder/index.dart';
import 'package:distance/index.dart' as distance;

mixin AuxiliaryWidget implements StatelessWidget {
  Widget buildAuxiliaryWidget(
    BuildContext context, {
    @required Widget child,
  }) {
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
