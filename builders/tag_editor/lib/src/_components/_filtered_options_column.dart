import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

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
            (option) => _buildMatchedOption(option, context),
          )
          .toList(),
    );
  }

  Widget _buildMatchedOption(String option, BuildContext context) {
    final theme = SemanticTheme.of(context);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(option),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.medium,
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
