import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:cells_list_view_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:tab/index.dart';

import '_builder.dart';

abstract class PropertyVerticalFullScreenArtboard
    extends TabbedFullScreenArtboard
    with
        RoofCellsListViewBuilder,
        SecondaryCenterButtonBuilder,
        PropertyArtboardBuilder {
  String get title => propertyTitle;

  StandardIconReference get titleIcon => homeIcon;

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return NavigationIcon.backArrow.buildWidget(color: theme.color.icon.nav);
  }

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);

    final moreButton = NavigationIcon.more.buildWidget(color: theme.color.icon.nav);

    return [moreButton];
  }

  // TODO convert this to accept data objects instead of widgets, build cells here
  List<Widget> buildLeasesCells(BuildContext context);

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    // TODO implement onTap passing to action button
    final leasesActionButton = buildSecondaryCenterButton(
      context,
      text: "Create lease",
      icon: XSmallIcon.lease,
      onTap: (context) => print("create lease tapped"),
      status: ButtonStatusOption.ready,
    );

    final leasesList = buildCellsList(
      context,
      children: buildLeasesCells(context),
      button: leasesActionButton,
    );

    final leasesTab = RoofTab(title: "Leases", view: leasesList);

    return [leasesTab];
  }
}

// class TagsWrap extends StatelessWidget {
//   final List<Widget> tags;

//   TagsWrap(this.tags);

//   final _spacing = distance.b;
//   final _verticalMargin = distance.b;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: _verticalMargin),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Wrap(
//             children: tags,
//             runSpacing: _spacing,
//             spacing: _spacing,
//           )
//         ],
//       ),
//     );
//   }
// }

// @override
// List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context) {
//   return null;
// }

// @override
// buildInfoRows(BuildContext context) {
//   final theme = RoofTheme.of(context);

//   final List<Widget> tagWidgets = [];

//   for (String tag in tags) {
//     final tagWidget = buildTag(
//       context,
//       text: tag,
//       color: theme.color.background.markerGray,
//     );

//     tagWidgets.add(tagWidget);
//   }

//   final tagsWrap = TagsWrap(tagWidgets);

//   final paymentProfileInfoRow = buildKeyValueRow(
//     context,
//     title: "Payment profile",
//     value: paymentProfile,
//   );

//   return [tagsWrap, paymentProfileInfoRow];
// }
