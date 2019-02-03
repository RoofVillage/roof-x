import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';
import '../artboard.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

abstract class FloatingArtboard extends Artboard {
  bool get allowsBackNavigation => true;

  List<Widget> buildChildren(BuildContext context);

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final children = buildChildren(context);
    return ConstrainedFloatingArtboardPage(
        color: theme.color.background.brandSecondary,
        shadow: theme.shadow,
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children)));
  }
}
