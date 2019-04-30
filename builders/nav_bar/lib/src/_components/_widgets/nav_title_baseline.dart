import 'package:flutter/material.dart';

class NavTitleBaseline extends StatelessWidget {
  final Text text;

  final double baseline = 20;

  NavTitleBaseline({this.text});

  @override
  Widget build(BuildContext context) {
    return Baseline(
      baseline: baseline,
      baselineType: TextBaseline.alphabetic,
      child: text,
    );
  }
}
