import 'package:flutter/material.dart';

import '../widgets/index.dart';

typedef ChildrenBuilder = List<Widget> Function(BuildContext context);

mixin FloatingArtboardState {
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
