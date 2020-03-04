import 'package:flutter/material.dart';

class NavTitleBaseline extends StatelessWidget {
  final Text text;
  final double baseline;

  NavTitleBaseline({
    this.text,
    baseline,
  }) : this.baseline = baseline ?? 25;

  @override
  Widget build(BuildContext context) {
    return Baseline(
      baseline: baseline,
      baselineType: TextBaseline.alphabetic,
      child: text,
    );
  }
}
