import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

import '_match_highlighted_text.dart';

class OptionsColumn extends StatelessWidget {
  final List<String> options;
  final String searchValue;
  final void Function(String) onTap;

  OptionsColumn({
    this.options,
    this.searchValue,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options
          .map(
            (option) => _buildMatchedOption(option),
          )
          .toList(),
    );
  }

  Widget _buildMatchedOption(String option) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(option),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: distance.c,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            MatchHighlightedText(
              text: option,
              compareTo: searchValue,
            ),
          ],
        ),
      ),
    );
  }
}
