import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertically_centered_text_builder/index.dart';
import 'package:x_small_icon_library/index.dart';

import 'ghost_cell.dart';
import '../types/alert_type.dart';

class AlertCell extends StatelessWidget with VerticallyCenteredTextBuilder {
  final String text;
  final XSmallIcon icon;
  final AlertType type;
  final void Function() onTap;

  AlertCell({
    @required this.text,
    this.icon,
    this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    Color textColor;
    Color iconColor;
    Color strokeColor;

    switch (type) {
      case AlertType.good:
        textColor = theme.color.text.good;
        iconColor = theme.color.icon.good;
        strokeColor = theme.color.stroke.good;
        break;
      case AlertType.warn:
        textColor = theme.color.text.warn;
        iconColor = theme.color.icon.warn;
        strokeColor = theme.color.stroke.warn;
        break;
      case AlertType.bad:
        textColor = theme.color.text.bad;
        iconColor = theme.color.icon.bad;
        strokeColor = theme.color.stroke.bad;
        break;
      case AlertType.neutral:
      default:
        textColor = theme.color.text.generalSecondary;
        iconColor = theme.color.icon.generalSecondary;
        strokeColor = theme.color.stroke.medium;
        break;
    }

    final nameText = Expanded(
      child: buildVerticallyCenteredText(
        Text(
          text,
          style: theme.typography.detailHeavy.textStyle(color: textColor),
        ),
      ),
    );

    final List<Widget> rowChildren = [nameText];

    if (icon != null) {
      final iconWidget = icon.buildWidget(color: iconColor);

      rowChildren.add(
        Padding(
          padding: EdgeInsets.only(
            left: theme.distance.spacing.horizontal.small,
          ),
          child: iconWidget,
        ),
      );
    }

    return GhostCell(
      child: Row(children: rowChildren),
      borderColor: strokeColor,
      onTap: onTap,
    );
  }
}
