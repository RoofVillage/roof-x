import 'package:flutter/material.dart';
import 'package:landlord_nav_drawer_artboard/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:stream_list_view_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:table_cell_builder/index.dart';

import '_data.dart';

class DomainsVerticalFullscreenArtboard
    extends StreamListViewVerticalFullScreenArtboard<LandlordProfilesView>
    with
        DomainsArtboardData,
        IconNavButtonBuilder,
        ViewStreamBuilderBuilder,
        SpacedListViewBuilder,
        TitleBadgeCellBuilder {
  Widget artboardNavButton(BuildContext context) => buildIconNavButton(
        context,
        iconReference: NavigationIcon.logoHouse,
        onTap: (context) => ArtboardNavigator.of(context).goTo(
          LandlordNavVerticalDrawerArtboard(),
        ),
      );

  @override
  Widget emptyStateWidget(BuildContext context) => Text('empty');

  @override
  Widget loadingStateWidget(BuildContext context) => Text('loading');

  @override
  List<Widget> listViewChildren(
    BuildContext context,
    LandlordProfilesView streamSnapshot,
  ) {
    return streamSnapshot.profiles.map((profile) {
      final String badgeText =
          (profile.notificationCount != null && profile.notificationCount > 0)
              ? profile.notificationCount.toString()
              : null;

      return buildTitleBadgeCell(
        title: profile.name,
        badgeText: badgeText,
      );
    }).toList();
  }
}
