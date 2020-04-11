import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class KeyValueRow extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle titleStyle;
  final TextStyle valueStyle;
  final bool rightAlignValue;

  KeyValueRow({
    this.title,
    this.value,
    this.titleStyle,
    this.valueStyle,
    this.rightAlignValue,
  });

  final double _minTitleWidth = 110;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleWidget = Container(
      constraints: BoxConstraints(
        minWidth: _minTitleWidth,
      ),
      margin: EdgeInsets.only(
        right: theme.distance.spacing.horizontal.medium,
      ),
      child: Text(
        title,
        style: titleStyle ??
            theme.typography.label.textStyle(
              color: theme.color.text.generalSecondary,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final valueWidget = Expanded(
      child: Text(
        value,
        style: valueStyle ??
            theme.typography.body.textStyle(
              color: theme.color.text.generalPrimary,
            ),
        textAlign: rightAlignValue ? TextAlign.right : TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    return Container(
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          titleWidget,
          valueWidget,
        ],
      ),
    );
  }
}
