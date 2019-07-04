import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:cells_list_view_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:tab/index.dart';
import 'package:navigator/index.dart';
import 'package:lease_create_artboard/index.dart';

import '_data.dart';

abstract class PropertyVerticalFullScreenArtboard
    extends TabbedFullScreenArtboard
    with
        RoofCellsListViewBuilder,
        SecondaryCenterButtonBuilder,
        IconNavButtonBuilder,
        PropertyArtboardData {
  String get title => propertyTitle;

  StandardIcon get titleIcon => homeIcon;

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return NavigationIcon.backArrow.buildWidget(color: theme.color.icon.nav);
  }

  Future<void> edit(BuildContext context) async {
    print("yo");
    ArtboardNavigator.of(context).goTo(
      LeaseCreateVerticalFloatingArtboard(),
    );
  }

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    // final theme = RoofTheme.of(context);

    final moreButton = buildIconNavButton(
      context,
      iconReference: NavigationIcon.settings,
      onTap: edit,
    );

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
      onTap: (context) => ArtboardNavigator.of(context).goTo(
            LeaseCreateVerticalFloatingArtboard(),
          ),
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
