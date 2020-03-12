import 'package:flutter/material.dart';
import 'package:landlord_nav_drawer_artboard/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:scroll_view_vertical_full_screen_artboard_template/index.dart';
import 'package:spaced_sliver_list_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:roof_table_cell_builder/index.dart';
import 'package:wallet_dashboard_artboard/index.dart';
import 'package:header_builder/index.dart';
import 'package:add_profile_artboard/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:icon_button_builder/index.dart';

import '_data.dart';

class DomainsVerticalFullscreenArtboard
    extends ScrollViewVerticalFullScreenArtboard
    with
        DomainsArtboardData,
        IconNavButtonBuilder,
        ViewStreamBuilderBuilder,
        TransferCellBuilder,
        SectionHeaderBuilder,
        SpacedSliverListBuilder,
        NavIconButtonBuilder,
        ActionIconButtonBuilder,
        TitleBadgeCellBuilder {
  Widget artboardNavButton(BuildContext context) => buildNavIconButton(
        iconReference: NavigationIcon.logoHouse,
        onTap: () => ArtboardNavigator.of(context).goTo(
          LandlordNavVerticalDrawerArtboard(),
        ),
      );

  List<Widget> artboardActionButtons(BuildContext context) => [
        buildSecondaryActionIconButton(
          iconReference: XSmallIcon.thread,
          onTap: () => print('goto settings'),
        ),
        buildPrimaryActionIconButton(
          iconReference: NavigationIcon.add,
          onTap: () => ArtboardNavigator.of(context).goTo(
            AddProfileVerticalFloatingArtboard(),
          ),
        )
      ];

  Widget profilesSection(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: profilesStream,
        loading: SliverToBoxAdapter(),
        empty: SliverToBoxAdapter(),
        child: (context, ServiceProfilesView snapshot) => buildSpacedSliverList(
          children: snapshot.profiles.map(
            (profile) {
              final badgeText = (profile.notificationCount != null &&
                      profile.notificationCount > 0)
                  ? profile.notificationCount.toString()
                  : null;

              final _onTap = () => ArtboardNavigator.of(context).goTo(
                    WalletDashboardVerticalFullscreenArtboard(profile.name),
                  );

              return buildTitleBadgeCell(
                title: profile.name,
                badgeText: badgeText,
                onTap: _onTap,
              );
            },
          ).toList(),
        ),
      );

  Widget recentTransfersSection(BuildContext context) =>
      buildViewStreamBuilder(context,
          stream: transfersStream,
          loading: SliverToBoxAdapter(child: Text('loading')),
          empty: SliverToBoxAdapter(child: Text('empty')),
          child: (context, RecentTransfersView snapshot) {
        final header = buildSectionHeader(
          text: 'Recent',
          horizontalGutter: horizontalGutter(context),
        );

        final cells = snapshot.transfers
            .map(
              (Transfer transfer) => buildTransferCell(
                amount: transfer.amount,
                date: transfer.date,
                sender: transfer.sender,
                receiver: transfer.receiver,
                note: transfer.note,
                onTap: () => print(
                  'goto transfer view for transfer w/ amount: ${transfer.amount}',
                ),
              ),
            )
            .toList();

        return SliverList(
          delegate: SliverChildListDelegate([
            header,
            ...cells,
          ]),
        );
      });

  @override
  List<Widget> children(BuildContext context) {
    return [
      profilesSection(context),
      recentTransfersSection(context),
    ];
  }
}
