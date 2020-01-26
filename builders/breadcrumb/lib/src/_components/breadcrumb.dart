import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:x_small_icon_library/index.dart';

class Breadcrumb extends StatelessWidget {
  final String title;
  final XSmallIcon iconReference;

  Breadcrumb({
    this.title,
    this.iconReference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> rowChildren = [];

    if (iconReference != null) {
      final iconWidget = Container(
        margin: EdgeInsets.symmetric(
            horizontal: theme.distance.spacing.horizontal.small),
        child: iconReference.buildWidget(
          color: theme.color.icon.generalSecondary,
        ),
      );

      rowChildren.add(iconWidget);
    }

    final textWidget = Flexible(
      child: Text(
        title,
        style: theme.typography.label.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      ),
    );

    rowChildren.add(textWidget);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: rowChildren,
    );
  }
}
