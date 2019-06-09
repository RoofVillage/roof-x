import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:date/index.dart';

import '_a.dart';

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

  @override
  Widget build(BuildContext context) {
    final bool isJoined = joinTimestamp != null;

    final List<Widget> rows = [];
    if (isJoined) {
      final joinedTimestampText =
          Date.fromSecondsSinceEpoch(joinTimestamp).toLongString;

      final joinedRow = buildKeyValueRow(
        context,
        title: "Joined on",
        value: joinedTimestampText,
      );
      rows.add(joinedRow);
    } else {
      final inviteKeyRow = buildKeyValueRow(
        context,
        title: "Invite key",
        value: inviteKey,
      );
      rows.add(inviteKeyRow);

      if (inviteSentTo != null) {
        final inviteSentRow = buildKeyValueRow(
          context,
          title: "Invite sent to",
          value: inviteSentTo,
        );
        rows.add(inviteSentRow);
      }
    }

    return CellA(
      title: name,
      rows: rows,
    );
  }
}
