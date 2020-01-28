import 'dart:math';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class MatchHighlightedText extends StatelessWidget {
  final String text;
  final String compareTo;
  final void Function(String) onTap;

  MatchHighlightedText({
    @required this.text,
    compareTo,
    this.onTap,
  }) : this.compareTo = compareTo ?? "";

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return RichText(
      text: TextSpan(
        children: _buildTextSpans(theme),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(SemanticThemeData theme) {
    String prematch = "";
    String match = "";
    String postmatch = "";

    bool isMatch = false;

    for (int i = 0; i < text.length; i++) {
      final endBound = min(i + compareTo.length, text.length);

      final sampleString = text.substring(i, endBound);

      if (sampleString.toLowerCase() == compareTo.toLowerCase()) {
        isMatch = true;

        prematch = text.substring(0, i);

        match = sampleString;

        postmatch = text.substring(endBound, text.length);
        break;
      } else if (i == text.length - 1) {
        prematch = text;
      }
    }

    final matchColor = theme.color.text.generalPrimary;
    final unmatchColor = theme.color.text.generalSecondary;

    final color = isMatch ? matchColor : unmatchColor;

    final matchedTextStyle = theme.typography.bodyHeavy.textStyle(color: color);
    final unmatchedTextStyle = theme.typography.body.textStyle(color: color);

    final prematchTextSpan = TextSpan(
      text: prematch,
      style: unmatchedTextStyle,
    );
    final matchTextSpan = TextSpan(
      text: match,
      style: matchedTextStyle,
    );
    final postmatchTextSpan = TextSpan(
      text: postmatch,
      style: unmatchedTextStyle,
    );

    return [
      prematchTextSpan,
      matchTextSpan,
      postmatchTextSpan,
    ];
  }
}
