import 'package:breadcrumb_stack_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:tag_builder/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:padded_list_builder/index.dart';
import 'package:distance/index.dart' as distance;

abstract class PropertyVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard
    with
        RoofTabbedContainerBuilder,
        PaddedListBuilder,
        KeyValueRowBuilder,
        RoofTagBuilder {
  String get propertyTitle;
  NavigationIconReference get homeIcon;
  List<String> get tags;
  String get paymentProfile;

  List<Widget> buildLeasesCells(BuildContext context);

  @override
  String get title => propertyTitle;

  @override
  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context) {
    return null;
  }

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return IconReference.backArrowNav.buildSvg(color: theme.color.icon.nav);
  }

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);

    final moreButton = IconReference.more.buildSvg(color: theme.color.icon.nav);

    return [moreButton];
  }

  @override
  buildInfoRows(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> tagWidgets = [];

    for (String tag in tags) {
      final tagWidget = buildTag(
        context,
        text: tag,
        color: theme.color.background.markerGray,
      );

      tagWidgets.add(tagWidget);
    }

    final tagsWrap = TagsWrap(tagWidgets);

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );

    return [tagsWrap, paymentProfileInfoRow];
  }

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    final leasesList = buildPaddedList(
      context,
      children: buildLeasesCells(context),
    );

    final leasesTab = RoofTab(title: "Leases", view: leasesList);

    return [leasesTab];
  }
}

class TagsWrap extends StatelessWidget {
  final List<Widget> tags;

  TagsWrap(this.tags);

  final _spacing = distance.b;
  final _verticalMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            children: tags,
            runSpacing: _spacing,
            spacing: _spacing,
          )
        ],
      ),
    );
  }
}
