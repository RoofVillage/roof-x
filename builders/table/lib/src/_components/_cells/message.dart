import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;
import 'package:key_value_row_builder/index.dart';
import 'package:date/index.dart';

class MessageCell extends StatelessWidget with KeyValueRowBuilder {
  final String subject;
  final String message;
  final int latestActivityTimestamp;

  MessageCell({
    this.subject,
    this.message,
    @required this.latestActivityTimestamp,
  });

  final _radius = radius.regular;
  final _cellPadding = distance.c;
  final _spacing = distance.c;
  final _sectionSpacing = distance.b;
  final _bottomMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Expanded(
      child: Text(
        subject,
        style: typography.bodyPrimaryThick.textStyleWithColor(
          theme.color.text.secondaryAction,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final formattedDateText = Date.fromSecondsSinceEpoch(latestActivityTimestamp).toAdaptiveString;

    final dateWidget = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: Text(
        formattedDateText,
        style: typography.detailPrimary.textStyleWithColor(
          theme.color.text.secondary,
        ),
      ),
    );

    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        titleWidget,
        dateWidget,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    if (message != null && message.isNotEmpty) {
      final messageRow = Container(
        margin: EdgeInsets.only(top: _sectionSpacing),
        child: Text(
          message,
          style: typography.bodySecondary.textStyleWithColor(
            theme.color.text.primary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
      columnChildren.add(messageRow);
    }

    final bodyColumn = Column(
      children: columnChildren,
    );

    return Container(
      padding: EdgeInsets.all(_cellPadding),
      margin: EdgeInsets.only(bottom: _bottomMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(_radius),
        border: Border.all(color: theme.color.stroke.light),
        color: theme.color.background.generalPrimary,
      ),
      child: bodyColumn,
    );
  }
}
