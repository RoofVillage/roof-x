import 'package:flutter/material.dart';
import 'package:spec/index.dart';

import '../input_dock.dart';

mixin AuxiliaryWidget implements StatelessWidget {
  Widget buildAuxiliaryWidget(
    BuildContext context, {
    @required Widget child,
  }) {
    final baseHeight = RoofInputDock.of(context).baseHeight;

    return Container(
      height: baseHeight,
      margin: EdgeInsets.only(right: RoofDistance.c),
      child: Center(
        child: child,
      ),
    );
  }
}
