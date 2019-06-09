import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;

import '../_widgets/cell_body_text_preview.dart';
import '../_widgets/cell_primary_title.dart';
import '../_widgets/cell_spaced_row.dart';

class CellA extends StatelessWidget {
  final String title;
  final Widget titleAccessory;
  final List<Widget> rows;
  final String note;
  final VoidCallback onTap;

  CellA({
    this.title,
    this.titleAccessory,
    this.rows,
    this.note,
    this.onTap,
  });

  final _tapHapticOption = HapticOption.light;
  final _cellPadding = distance.c;
  final _topMargin = distance.b;
  final _spacing = distance.b;
  final _cornerRadius = radius.regular;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  Widget buildTitleRow() {
    final hasTitle = title != null && title.isNotEmpty;
    final hasTitleAccessory = title != null;

    if (!hasTitle && !hasTitleAccessory) return null;

    final List<Widget> rowChildren = [];

    if (hasTitle) {
      rowChildren.add(CellPrimaryTitle(title));
    }

    if (hasTitleAccessory) {
      final spacedTitleAccessory = Container(
        margin: EdgeInsets.only(left: _spacing),
        child: titleAccessory,
      );

      rowChildren.add(spacedTitleAccessory);
    }

    return CellSpacedRow(children: rowChildren);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> columnChildren = [];

    if (buildTitleRow() != null) columnChildren.add(buildTitleRow());

    if (rows != null && rows.isNotEmpty) columnChildren.addAll(rows);

    if (note != null && note.isNotEmpty) {
      if (columnChildren.isNotEmpty) {
        final paddedNote = Container(
          margin: EdgeInsets.only(top: _spacing),
          child: CellBodyTextPreview(note),
        );
        columnChildren.add(paddedNote);
      } else {
        columnChildren.add(CellBodyTextPreview(note));
      }
    }

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(_cellPadding),
        margin: EdgeInsets.only(top: _topMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(_cornerRadius),
          border: Border.all(color: theme.color.stroke.light),
          color: theme.color.background.inputForeground,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren,
        ),
      ),
    );
  }
}
