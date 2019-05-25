import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;

import '../tag.dart';

class LeaseCell extends StatelessWidget {
  final List<String> tenants;
  final String name;
  final int rentAmount;
  final int startTimestamp;
  final int endTimestamp;
  final LeaseStatus status;

  LeaseCell({
    this.tenants,
    @required this.name,
    @required this.rentAmount,
    @required this.startTimestamp,
    this.endTimestamp,
    @required this.status,
  });

  final _radius = radius.regular;
  final _cellPadding = distance.c;
  final _spacing = distance.b;
  final _sectionSpacing = distance.c;
  final _bottomMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Text(
      name,
      style: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.secondaryAction,
      ),
    );

    final statusWidget = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(status),
    );

    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        titleWidget,
        statusWidget,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    final formattedAmount = applyMask(
      MaskOption.money,
      text: rentAmount.toString(),
      context: context,
    );

    final rentWidget = Container(
      margin: EdgeInsets.only(right: _spacing),
      child: Text(
        formattedAmount,
        style: typography.bodyPrimaryThick.textStyleWithColor(
          theme.color.text.primary,
        ),
      ),
    );

    final dateWidget = _DateRange(
      startTimestamp,
      endTimestamp,
    );

    final statsRow = Container(
      margin: EdgeInsets.only(top: _sectionSpacing),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          rentWidget,
          dateWidget,
        ],
      ),
    );

    columnChildren.add(statsRow);

    if (tenants != null) {
      final tenantsSection = Container(
        margin: EdgeInsets.only(
          top: _sectionSpacing,
        ),
        child: _Tenants(tenants),
      );
      columnChildren.add(tenantsSection);
    }

    final bodyColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnChildren,
    );

    return Container(
      padding: EdgeInsets.all(_cellPadding),
      margin: EdgeInsets.only(top: _bottomMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(_radius),
        border: Border.all(color: theme.color.stroke.light),
        color: theme.color.background.generalPrimary,
      ),
      child: bodyColumn,
    );
  }
}

class _Tenants extends StatelessWidget {
  final List<String> tenants;

  _Tenants(this.tenants);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    String tenantString = "";

    for (int i = 0; i < tenants.length; i++) {
      final bool isLastTenant = i == tenants.length - 1;

      tenantString += tenants[i] + (isLastTenant ? "" : ", ");
    }

    return Text(
      tenantString,
      style: typography.bodySecondary.textStyleWithColor(
        theme.color.text.primary,
      ),
    );
  }
}

class _DateRange extends StatelessWidget {
  final int startTimestamp;
  final int endTimestamp;

  _DateRange(
    this.startTimestamp,
    this.endTimestamp,
  );

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final startTimestampText =
        Date.fromSecondsSinceEpoch(startTimestamp).toLongString;
    final endTimestampText =
        Date.fromSecondsSinceEpoch(endTimestamp).toLongString;
    final formattedDateString = "$startTimestampText - $endTimestampText";

    return Text(
      formattedDateString,
      style: typography.detailSecondary.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final LeaseStatus status;

  _StatusTag(this.status);

  _getStatusColor(LeaseStatus status, RoofInheritedTheme theme) {
    switch (status) {
      case LeaseStatus.active:
        return theme.color.background.markerGreen;
        break;
      case LeaseStatus.ended:
      case LeaseStatus.upcoming:
      default:
        return theme.color.background.markerGray;
    }
  }

  _getStatusText(LeaseStatus status) {
    switch (status) {
      case LeaseStatus.active:
        return "ACTIVE";
        break;
      case LeaseStatus.ended:
        return "ENDED";
      case LeaseStatus.upcoming:
        return "UPCOMING";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final text = _getStatusText(status);
    final color = _getStatusColor(status, theme);

    return Tag(
      text: text,
      color: color,
    );
  }
}

enum LeaseStatus {
  active,
  upcoming,
  ended,
}
