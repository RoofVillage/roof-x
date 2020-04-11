import 'package:flutter/material.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:scroll_view_vertical_full_screen_artboard_template/index.dart';
import 'package:small_icon_library/index.dart';
import 'package:spaced_sliver_list_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:wallet_dashboard_artboard/index.dart';
import 'package:header_builder/index.dart';
import 'package:icon_button_builder/index.dart';
import 'package:user_settings_artboard/index.dart';
import 'package:add_wallet_artboard/index.dart';

import '_data.dart';

class WalletsVerticalFullscreenArtboard
    extends ScrollViewVerticalFullScreenArtboard
    with
        WalletsArtboardData,
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
      onTap: () => print('house tapped'));

  List<Widget> artboardActionButtons(BuildContext context) => [
        buildSecondaryActionIconButton(
          iconReference: SmallIcon.settings,
          onTap: () => ArtboardNavigator.of(context).goTo(
            UserSettingsVerticalFullscreenArtboard(),
          ),
        ),
        buildPrimaryActionIconButton(
          iconReference: NavigationIcon.add,
          onTap: () => ArtboardNavigator.of(context).goTo(
            AddWalletVerticalFloatingArtboard(),
          ),
        )
      ];

  Widget walletsSection(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: profilesStream,
        loading: SliverToBoxAdapter(),
        empty: SliverToBoxAdapter(),
        child: (context, ServiceProfilesView snapshot) {
          Widget buildProfileCell(ServiceProfile profile) {
            final badgeText = (profile.notificationCount != null &&
                    profile.notificationCount > 0)
                ? profile.notificationCount.toString()
                : null;

            final onTap = () => ArtboardNavigator.of(context).goTo(
                  WalletDashboardVerticalFullscreenArtboard(profile.name),
                );

            return buildTitleBadgeCell(
              title: profile.name,
              subtitle: profile.ownerIsInScope == true ? "(Personal)" : null,
              badgeText: badgeText,
              onTap: onTap,
            );
          }

          final ownDomains = snapshot.profiles
              .where((profile) => profile.ownerIsInScope == true)
              .map((profile) => buildProfileCell(profile))
              .toList();

          final businessDomains = snapshot.profiles
              .where((profile) => profile.ownerIsInScope != true)
              .map((profile) => buildProfileCell(profile))
              .toList();

          return buildSpacedSliverList(children: [
            ...ownDomains,
            ...businessDomains,
          ]);
        },
      );

  Widget recentTransfersSection(BuildContext context) =>
      buildViewStreamBuilder(context,
          stream: transfersStream,
          loading: SliverToBoxAdapter(child: Text('loading')),
          empty: SliverToBoxAdapter(child: Text('empty')),
          child: (context, RecentTransfersView snapshot) {
        final header = buildSectionHeader(
          title: 'Recent',
          horizontalGutter: horizontalGutter(context),
        );

        final cells = snapshot.transfers
            .map(
              (Transfer transfer) => buildTransferCell(
                amount: transfer.amount,
                date: transfer.date,
                domain: transfer.domain,
                sender: transfer.sender,
                receiver: transfer.receiver,
                note: transfer.note,
                transferStatus: transfer.transferStatus,
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
      walletsSection(context),
      recentTransfersSection(context),
    ];
  }
}
