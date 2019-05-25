import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:corner_radius/index.dart' as radius;
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

import '../tag.dart';

class HomeCell extends StatelessWidget {
  final String address;
  final String unit;
  final StandardIconReference iconReference;
  final List<RoofLeasePreview> activeLeases;
  final List<RoofLeasePreview> inactiveLeases;
  final List<String> tags;
  final VoidCallback onTap;

  HomeCell({
    @required this.address,
    this.unit,
    this.iconReference,
    this.activeLeases,
    this.inactiveLeases,
    this.tags,
    this.onTap,
  });

  final _radius = radius.regular;
  final _cellPadding = distance.c;
  final _spacing = distance.b;
  final _sectionSpacing = distance.d;
  final _bottomMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleRow = _TitleRow(
      address: address,
      unit: unit,
      iconReference: iconReference,
      spacing: _spacing,
    );

    List<Widget> columnChildren = [titleRow];

    if (activeLeases != null) {
      final activeLeasesColumn = _LeasePreviewsColumn(leases: activeLeases);

      columnChildren.addAll([
        _SectionTitle(
          "Active leases",
          topMargin: _sectionSpacing,
        ),
        activeLeasesColumn,
      ]);
    }

    if (inactiveLeases != null) {
      final inactiveLeasesColumn = _LeasePreviewsColumn(leases: inactiveLeases);

      columnChildren.addAll([
        _SectionTitle(
          "Inactive leases",
          topMargin: _sectionSpacing,
        ),
        inactiveLeasesColumn,
      ]);
    }

    if (tags != null) {
      final tagsSection = Container(
        margin: EdgeInsets.only(
          top: _sectionSpacing,
        ),
        child: _TagsSection(tags: tags),
      );

      columnChildren.add(tagsSection);
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

class _TitleRow extends StatelessWidget {
  final String address;
  final String unit;
  final StandardIconReference iconReference;
  final double spacing;

  _TitleRow({
    this.address,
    this.unit,
    this.iconReference,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final defaultIconReference = IconReference.house;

    final StandardIconReference homeIcon =
        iconReference ?? defaultIconReference;

    final homeIconWidget = Padding(
      padding: EdgeInsets.only(right: spacing),
      child: homeIcon.buildSvg(color: theme.color.icon.general),
    );

    final formattedTitleString = "$address - $unit";

    final homeTitle = Text(
      formattedTitleString,
      style: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.secondaryAction,
      ),
      overflow: TextOverflow.ellipsis,
    );

    return Row(
      children: <Widget>[
        homeIconWidget,
        homeTitle,
      ],
    );
  }
}

class _LeasePreviewsColumn extends StatelessWidget {
  final List<RoofLeasePreview> leases;

  _LeasePreviewsColumn({@required this.leases});

  _getStatusColor(TenantStatus status) {
    switch (status) {
      case TenantStatus.ready:
        return Colors.green;
      case TenantStatus.pending:
      default:
        return Colors.grey;
    }
  }

  final double _indicatorSize = 10;
  final double _spacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> leasesWidgets = [];

    for (int i = 0; i < leases.length; i++) {
      final lease = leases[i];

      final statusIndicatorWidget = Container(
        height: _indicatorSize,
        width: _indicatorSize,
        margin: EdgeInsets.only(right: _spacing),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_indicatorSize / 2)),
          color: _getStatusColor(lease.status),
        ),
      );

      final formattedAmount = applyMask(
        MaskOption.money,
        text: lease.amount.toString(),
        context: context,
      );

      final amountWidget = Container(
        margin: EdgeInsets.only(right: _spacing),
        child: Text(
          formattedAmount,
          style: typography.bodyPrimaryThick
              .textStyleWithColor(theme.color.text.primary),
        ),
      );

      final startTimestampText =
          Date.fromSecondsSinceEpoch(lease.startTimestamp).toLongString;
      final endTimestampText =
          Date.fromSecondsSinceEpoch(lease.endTimestamp).toLongString;
      final formattedDateString = "$startTimestampText - $endTimestampText";

      final dateWidget = Text(
        formattedDateString,
        style: typography.detailSecondary.textStyleWithColor(
          theme.color.text.secondary,
        ),
      );

      final textRow = Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[amountWidget, dateWidget],
      );

      final bool isLastLease = i == leases.length - 1;
      final leasePreviewWidget = Container(
        margin: isLastLease ? null : EdgeInsets.only(bottom: _spacing),
        child: Row(
          children: <Widget>[
            statusIndicatorWidget,
            textRow,
          ],
        ),
      );

      leasesWidgets.add(leasePreviewWidget);
    }

    return Column(
      children: leasesWidgets,
    );
  }
}

class _TagsSection extends StatelessWidget {
  final List<String> tags;

  _TagsSection({@required this.tags});

  final _spacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> tagWidgets = [];

    for (String tag in tags) {
      final tagColor = theme.color.background.markerGray;

      final tagWidget = Tag(
        text: tag.toUpperCase(),
        color: tagColor,
      );

      tagWidgets.add(tagWidget);
    }

    return Wrap(
      spacing: _spacing,
      runSpacing: _spacing,
      children: tagWidgets,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final double topMargin;

  _SectionTitle(this.text, {this.topMargin});

  final _bottomMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    return Container(
      margin: EdgeInsets.only(top: topMargin ?? 0, bottom: _bottomMargin),
      child: Text(
        text,
        style: typography.title.textStyleWithColor(theme.color.text.secondary),
      ),
    );
  }
}

class RoofLeasePreview {
  final String title;
  final int startTimestamp;
  final int endTimestamp;
  final double amount;
  final TenantStatus status;

  RoofLeasePreview({
    @required this.title,
    @required this.startTimestamp,
    this.endTimestamp,
    @required this.amount,
    @required this.status,
  });
}

enum TenantStatus {
  pending,
  ready,
}
