import 'package:flutter/material.dart';
import 'package:input_dock_builder/index.dart';

class AuxiliaryWidget extends StatelessWidget {
  final Widget child;

  AuxiliaryWidget({this.child});

  @override
  Widget build(BuildContext context) {
    final baseHeight = InputDock.of(context).baseHeight;

    return Container(
      height: baseHeight,
      child: Center(
        child: child,
      ),
    );
  }
}
