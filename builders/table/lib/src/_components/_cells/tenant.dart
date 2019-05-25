import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:corner_radius/index.dart' as radius;
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

class TenantCell extends StatelessWidget with KeyValueRowBuilder {
  final String name;
  final String inviteKey;
  final int joinTimestamp;
  final String inviteSentTo;
  final VoidCallback onTap;

  TenantCell({
    @required this.name,
    this.inviteKey,
    this.joinTimestamp,
    this.inviteSentTo,
    this.onTap,
  });

  final _radius = radius.regular;
  final _cellPadding = distance.c;
  final _bottomMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final bool isJoined = joinTimestamp != null;

    final titleWidget = Text(
      name,
      style: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.secondaryAction,
      ),
    );

    List<Widget> columnChildren = [titleWidget];

    if (isJoined) {
      final joinedTimestampText =
          Date.fromSecondsSinceEpoch(joinTimestamp).toLongString;

      final joinedWidget = buildKeyValueRow(
        context,
        title: "Joined on",
        value: joinedTimestampText,
        hasBorder: false,
      );
      columnChildren.add(joinedWidget);
    } else {
      final inviteKeyWidget = buildKeyValueRow(
        context,
        title: "Invite key",
        value: inviteKey,
        hasBorder: false,
      );
      columnChildren.add(inviteKeyWidget);

      if (inviteSentTo != null) {
        final inviteSentWidget = buildKeyValueRow(
          context,
          title: "Invite sent to",
          value: inviteSentTo,
          hasBorder: false,
        );
        columnChildren.add(inviteSentWidget);
      }
    }

    final bodyColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnChildren,
    );

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(_cellPadding),
        margin: EdgeInsets.only(top: _bottomMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(_radius),
          border: Border.all(color: theme.color.stroke.light),
          color: theme.color.background.generalPrimary,
        ),
        child: bodyColumn,
      ),
    );
  }
}
