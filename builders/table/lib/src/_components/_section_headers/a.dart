import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class TableSectionHeaderA extends StatelessWidget {
  final String title;

  TableSectionHeaderA({@required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Container(
      color: theme.color.background.general,
      child: Center(
        child: _TitleLabel(text: title),
      ),
    );
  }
}

class _TitleLabel extends StatelessWidget {
  final String text;

  _TitleLabel({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Text(
      text,
      style: theme.typography.title.textStyle(
        color: theme.color.text.brand,
      ),
    );
  }
}
