import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class PaddedList extends StatelessWidget {
  final List<Widget> children;

  PaddedList({this.children});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: children,
      ),
    );
  }
}
