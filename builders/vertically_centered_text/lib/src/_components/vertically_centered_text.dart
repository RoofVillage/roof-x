import 'package:flutter/material.dart';

class VerticallyCenteredText extends StatelessWidget {
  final Text text;

  VerticallyCenteredText(this.text);

  @override
  Widget build(BuildContext context) {
    return Baseline(
      baseline: text.style.fontSize,
      baselineType: TextBaseline.alphabetic,
      child: text,
    );
  }
}
