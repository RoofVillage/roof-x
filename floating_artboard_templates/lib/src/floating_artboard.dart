import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'widgets/index.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class FloatingArtboard extends Artboard {
  bool get allowsBackNavigation => true;

  List<Widget> buildChildren(BuildContext context);

  Widget build(BuildContext context) {
    final children = buildChildren(context);
    return FloatingArtboardContainer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children));
  }
}
