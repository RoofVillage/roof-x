import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:table_builder/src/_components/_widgets/cell_primary_title.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:tag_builder/index.dart';

class HomeCell extends StatelessWidget {
  final String address;
  final String unit;
  final StandardIcon iconReference;
  final List<LeasePreview> activeLeases;
  final List<LeasePreview> inactiveLeases;
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

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleRow = _TitleRow(
      address: address,
      unit: unit,
      iconReference: iconReference,
    );

    List<Widget> columnChildren = [titleRow];

    if (activeLeases != null) {
      final activeLeasesColumn = _LeasePreviewsColumn(leases: activeLeases);

      columnChildren.addAll([
        _SectionTitle(
          "Active leases",
          topMargin: theme.distance.spacing.vertical.large,
        ),
        activeLeasesColumn,
      ]);
    }

    if (inactiveLeases != null) {
      final inactiveLeasesColumn = _LeasePreviewsColumn(leases: inactiveLeases);

      columnChildren.addAll([
        _SectionTitle(
          "Inactive leases",
          topMargin: theme.distance.spacing.vertical.large,
        ),
        inactiveLeasesColumn,
      ]);
    }

    if (tags != null) {
      final tagsSection = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.large,
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
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.medium,
        ),
        margin: EdgeInsets.only(top: theme.distance.spacing.vertical.large),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(theme.radius.medium),
          border: Border.all(color: theme.color.stroke.medium),
          color: theme.color.background.raised,
        ),
        child: bodyColumn,
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  final String address;
  final String unit;
  final StandardIcon iconReference;

  _TitleRow({
    this.address,
    this.unit,
    this.iconReference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final defaultIconReference = StandardIcon.house;

    final StandardIcon homeIcon = iconReference ?? defaultIconReference;

    final homeIconWidget = Padding(
      padding: EdgeInsets.only(
        right: theme.distance.spacing.horizontal.small,
      ),
      child: homeIcon.buildWidget(
        color: theme.color.icon.generalPrimary,
      ),
    );

    final formattedTitleString = "$address - $unit";

    final homeTitle = CellPrimaryTitle(formattedTitleString);

    return Row(
      children: <Widget>[
        homeIconWidget,
        homeTitle,
      ],
    );
  }
}

class _LeasePreviewsColumn extends StatelessWidget {
  final List<LeasePreview> leases;

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

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> leasesWidgets = [];

    for (LeasePreview lease in leases) {
      final statusIndicatorWidget = Container(
        height: _indicatorSize,
        width: _indicatorSize,
        margin: EdgeInsets.only(
          right: theme.distance.spacing.horizontal.small,
        ),
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
        margin: EdgeInsets.only(
          right: theme.distance.spacing.horizontal.small,
        ),
        child: Text(
          formattedAmount,
          style: theme.typography.bodyHeavy.textStyle(
            color: theme.color.text.generalPrimary,
          ),
        ),
      );

      final startTimestampText = Date.fromSecondsSinceEpoch(
        lease.startTimestamp,
      ).toLongString;
      final endTimestampText = Date.fromSecondsSinceEpoch(
        lease.endTimestamp,
      ).toLongString;
      final formattedDateString = "$startTimestampText - $endTimestampText";

      final dateWidget = Text(
        formattedDateString,
        style: theme.typography.detail.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      );

      final textRow = Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[amountWidget, dateWidget],
      );

      final leasePreviewWidget = Container(
        margin: lease == leases.last
            ? null
            : EdgeInsets.only(
                bottom: theme.distance.spacing.vertical.small,
              ),
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

class _TagsSection extends StatelessWidget with TagBuilder {
  final List<String> tags;

  _TagsSection({@required this.tags});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> tagWidgets = [];

    for (String tag in tags) {
      final tagWidget = buildTag(
        context,
        text: tag.toUpperCase(),
      );

      tagWidgets.add(tagWidget);
    }

    return Wrap(
      spacing: theme.distance.spacing.horizontal.small,
      runSpacing: theme.distance.spacing.vertical.small,
      children: tagWidgets,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final double topMargin;

  _SectionTitle(
    this.text, {
    this.topMargin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
        bottom: theme.distance.spacing.vertical.small,
      ),
      child: Text(
        text,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      ),
    );
  }
}

class LeasePreview {
  final String title;
  final int startTimestamp;
  final int endTimestamp;
  final double amount;
  final TenantStatus status;

  LeasePreview({
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
