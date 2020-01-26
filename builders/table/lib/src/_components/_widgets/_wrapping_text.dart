import 'package:flutter/material.dart';

class WrappingText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;

  WrappingText({
    @required this.text,
    this.style,
    this.maxLines = 2,
  });

  final _overflowKind = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: _overflowKind,
      ),
    );
  }
}
