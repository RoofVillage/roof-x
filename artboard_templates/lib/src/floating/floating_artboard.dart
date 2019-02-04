import 'package:flutter/material.dart';

import 'widgets/index.dart';
import '../artboard.dart';

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
