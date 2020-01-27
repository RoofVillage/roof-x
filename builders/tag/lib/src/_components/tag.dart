import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:tag_kind_option/index.dart';

class StandardTag extends StatelessWidget {
  final String text;
  final TagKindOption kind;

  StandardTag({
    this.text,
    this.kind = TagKindOption.normal,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    Color _textColor = theme.color.text.generalPrimary;
    Color _backgroundColor = theme.color.background.neutralContrast;

    switch (kind) {
      case TagKindOption.error:
        _textColor = theme.color.text.onNotifyBackground;
        _backgroundColor = theme.color.background.warn;
        break;
      case TagKindOption.good:
        _textColor = theme.color.text.onNotifyBackground;
        _backgroundColor = theme.color.background.good;
        break;
      case TagKindOption.emergency:
        _textColor = theme.color.text.onNotifyBackground;
        _backgroundColor = theme.color.background.bad;
        break;
      case TagKindOption.normal:
        break;
    }

    final textStyle = theme.typography.detail.textStyle(
      color: _textColor,
    );

    final textWidget = Text(
      text,
      style: textStyle,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.padding.horizontal.min,
        vertical: theme.distance.padding.vertical.min,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          theme.radius.min,
        ),
        color: _backgroundColor,
      ),
      child: textWidget,
    );
  }
}
