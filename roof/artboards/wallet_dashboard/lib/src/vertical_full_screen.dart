import 'package:flutter/material.dart';
import 'package:balance_actions_artboard/index.dart';
import 'package:landlord_nav_drawer_artboard/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:roof_table_cell_builder/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:scroll_view_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';

import '_data.dart';

class WalletDashboardVerticalFullscreenArtboard
    extends ScrollViewVerticalFullScreenArtboard
    with
        WalletDashboardArtboardData,
        IconNavButtonBuilder,
        ViewStreamBuilderBuilder,
        BalanceCellBuilder,
        TransferCellBuilder,
        SpacedListViewBuilder {
  final String walletName;

  WalletDashboardVerticalFullscreenArtboard(this.walletName);

  String get artboardTitle => walletName;

  @override
  horizontalGutter(BuildContext context) =>
      SemanticTheme.of(context).distance.gutter.horizontal.medium;

  Widget artboardNavButton(BuildContext context) => buildIconNavButton(
        context,
        iconReference: NavigationIcon.logoHouse,
        onTap: (context) => ArtboardNavigator.of(context).goTo(
          LandlordNavVerticalDrawerArtboard(),
        ),
      );

  Widget balanceSection(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: balanceStream,
        loading: SliverToBoxAdapter(child: Text('loading')),
        empty: SliverToBoxAdapter(child: Text('empty')),
        child: (context, snapshot) {
          final theme = SemanticTheme.of(context);

          return SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                theme.distance.gutter.horizontal.medium,
                theme.distance.gutter.vertical.medium,
                theme.distance.gutter.horizontal.medium,
                theme.distance.gutter.vertical.max,
              ),
              child: buildBalanceCell(
                balance: snapshot.balance,
                onTap: () => ArtboardNavigator.of(context).goTo(
                  BalanceActionsVerticalFloatingArtboard(),
                ),
              ),
            ),
          );
        },
      );

  Widget recentTransfersSection(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: transfersStream,
        loading: SliverToBoxAdapter(child: Text('loading')),
        empty: SliverToBoxAdapter(child: Text('empty')),
        child: (context, RecentTransfersView snapshot) => SliverList(
          delegate: SliverChildListDelegate(
            snapshot.transfers
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
                .toList(),
          ),
        ),
      );

  @override
  List<Widget> children(BuildContext context) {
    return [
      balanceSection(context),
      recentTransfersSection(context),
    ];
  }
}
