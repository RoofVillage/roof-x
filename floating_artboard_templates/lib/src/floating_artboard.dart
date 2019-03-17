import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'widgets/index.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class FloatingArtboard extends Artboard {
  bool get allowsBackNavigation => true;

  List<Widget> buildChildren(BuildContext context);

  @override
  State<StatefulWidget> createState() => FloatingArtboardState();
}

class FloatingArtboardState extends State<FloatingArtboard> {
  @override
  Widget build(BuildContext context) {
    final children = widget.buildChildren(context);
    return FloatingArtboardContainer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children));
  }
}
