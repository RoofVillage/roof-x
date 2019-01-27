import 'package:flutter/material.dart';

import 'package:spec/theme/index.dart';
import 'package:spec/distance.dart';

abstract class RoofNavButton extends StatelessWidget {
  Widget iconForTheme(RoofInheritedTheme theme);
  Function onTap();

  final _padding = EdgeInsets.symmetric(horizontal: RoofDistance.b);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return GestureDetector(
        onTap: onTap(),
        child: Container(padding: _padding, child: iconForTheme(theme)));
  }
}
