import 'package:date/index.dart';
import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:tag_builder/index.dart';
import 'package:property/index.dart';
import 'package:lease_preview/index.dart';

class PropertyCell extends StatelessWidget
    with CardCellBuilder, TagBuilder {
  final Property property;
  final void Function() onTap;

  PropertyCell({
    @required this.property,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> columnChildren = [
      _buildTitleWidget(property, context),
    ];

    final List<Widget> leasesSections = [];

    if (property.activeLeases.isNotEmpty) {
      leasesSections.add(
        _buildLeaseSection(
          context,
          leases: property.activeLeases,
          sectionTitle: "Active leases",
        ),
      );
    }

    if (property.upcomingLeases.isNotEmpty) {
      final upcomingLeasesSection = _buildLeaseSection(
        context,
        leases: property.upcomingLeases,
        sectionTitle: "Upcoming leases",
      );

      leasesSections.add(
        leasesSections.isNotEmpty
            ? Container(
                margin: EdgeInsets.only(
                  top: theme.distance.spacing.vertical.small,
                ),
                child: upcomingLeasesSection,
              )
            : upcomingLeasesSection,
      );
    }

    if (leasesSections.isNotEmpty) {
      final leasesSectionsColumn = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.medium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: leasesSections,
        ),
      );
      columnChildren.add(leasesSectionsColumn);
    }

    if (property.tags.isNotEmpty) {
      final tagsSection = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.medium,
        ),
        child: _buildTagsWrap(
          context,
          tags: property.tags,
        ),
      );
      columnChildren.add(tagsSection);
    }

    final cellColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnChildren,
    );

    return buildCardCell(child: cellColumn);
  }

  Widget _buildTitleWidget(Property property, BuildContext context) {
    final theme = SemanticTheme.of(context);

    final addressString = property.unit != null
        ? "${property.address} - ${property.unit}"
        : property.address;

    return Text(
      addressString,
      style: theme.typography.title.textStyle(
        color: theme.color.text.action,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _buildLeaseSection(
    BuildContext context, {
    @required List<LeasePreview> leases,
    @required String sectionTitle,
  }) {
    final theme = SemanticTheme.of(context);

    final activeLeasesSectionTitle = Container(
      margin: EdgeInsets.only(
        bottom: theme.distance.spacing.vertical.min,
      ),
      child: Text(
        sectionTitle,
        style: theme.typography.detailHeavy.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      ),
    );

    final activeLeasesWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildLeaseWraps(leases, context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        activeLeasesSectionTitle,
        activeLeasesWidget,
      ],
    );
  }

  List<Widget> _buildLeaseWraps(
    List<LeasePreview> leases,
    BuildContext context,
  ) {
    final theme = SemanticTheme.of(context);

    return leases.map((lease) {
      final leaseName = Text(
        lease.name,
        style: theme.typography.body.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      );

      final leaseAmount = Text(
        applyMask(
          MaskOption.moneyNoDecimals,
          text: lease.amount.toString(),
          
          context: context,
        ),
        style: theme.typography.bodyHeavy.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      );

      final leaseDate = Text(
        "${Date.fromDateTime(lease.start).toFullDigits} - ${Date.fromDateTime(lease.end).toFullDigits}",
        style: theme.typography.detail.textStyle(
          color: theme.color.text.generalSecondary,
        ),
      );

      return Wrap(
        children: [
          leaseName,
          leaseAmount,
          leaseDate,
        ],
        spacing: theme.distance.spacing.horizontal.small,
        crossAxisAlignment: WrapCrossAlignment.end,
      );
    }).toList();
  }

  Widget _buildTagsWrap(
    BuildContext context, {
    List<String> tags,
  }) {
    final theme = SemanticTheme.of(context);

    final tagsWidgets = tags
        .map(
          (tag) => buildTag(context, text: tag),
        )
        .toList();

    return Wrap(
      children: tagsWidgets,
      spacing: theme.distance.spacing.horizontal.min,
      runSpacing: theme.distance.spacing.vertical.min,
    );
  }
}
