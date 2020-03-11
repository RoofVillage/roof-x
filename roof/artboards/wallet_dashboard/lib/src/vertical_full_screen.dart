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
import 'package:spaced_sliver_list_builder/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:choose_wallet_verification_type_artboard/index.dart';

import '_data.dart';

class WalletDashboardVerticalFullscreenArtboard
    extends ScrollViewVerticalFullScreenArtboard
    with
        WalletDashboardArtboardData,
        IconNavButtonBuilder,
        ViewStreamBuilderBuilder,
        BalanceCellBuilder,
        TransferCellBuilder,
        AlertCellBuilder,
        SpacedSliverListBuilder {
  final String walletName;

  WalletDashboardVerticalFullscreenArtboard(this.walletName);

  String get artboardTitle => walletName;

  Widget artboardNavButton(BuildContext context) => buildIconNavButton(
        context,
        iconReference: NavigationIcon.backArrow,
        onTap: (context) => ArtboardNavigator.of(context).pop(),
      );

  Widget balanceSection(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: walletOverviewStream,
        loading: SliverToBoxAdapter(child: Text('loading')),
        empty: SliverToBoxAdapter(child: Text('empty')),
        child: (context, WalletOverview snapshot) {
          final theme = SemanticTheme.of(context);

          final balanceCell = buildBalanceCell(
            balance: snapshot.balance,
            onTap: () => ArtboardNavigator.of(context).goTo(
              BalanceActionsVerticalFloatingArtboard(),
            ),
          );

          if (snapshot.status == WalletStatus.verified) {
            return SliverToBoxAdapter(
              child: Padding(
                child: balanceCell,
                padding: EdgeInsets.fromLTRB(
                  horizontalGutter(context),
                  theme.distance.gutter.vertical.medium,
                  horizontalGutter(context),
                  theme.distance.gutter.vertical.max,
                ),
              ),
            );
          } else {
            final sliverWidgets = <Widget>[];

            String statusAlertText;
            AlertType alertType;
            void Function() statusAlertAction =
                () => ArtboardNavigator.of(context).goTo(
                      ChooseWalletVerificationTypeVerticalFloatingArtboard(),
                    );

            switch (snapshot.status) {
              case WalletStatus.verified:
                break;
              case WalletStatus.unverified:
                alertType = AlertType.neutral;
                statusAlertText = "Verify your wallet";
                break;
              case WalletStatus.retry:
                alertType = AlertType.warn;
                statusAlertText =
                    "We need some more info to finish your verification.";
                break;
              case WalletStatus.document:
                alertType = AlertType.warn;
                statusAlertText =
                    "Please upload a document to finish your identity verification.";
                break;
              case WalletStatus.suspended:
                alertType = AlertType.warn;
                statusAlertAction = null;
                statusAlertText =
                    "Your account has been suspended, please email support@roof.io to learn more.";
                break;
            }

            if (statusAlertText != null) {
              sliverWidgets.add(
                buildAlertCell(
                  text: statusAlertText,
                  icon:
                      statusAlertAction != null ? XSmallIcon.rightArrow : null,
                  type: alertType,
                  onTap: statusAlertAction,
                ),
              );
            }

            sliverWidgets.add(balanceCell);

            return SliverPadding(
              sliver: buildSpacedSliverList(
                children: sliverWidgets,
                horizontalGutter: horizontalGutter(context),
              ),
              padding: EdgeInsets.only(
                bottom: theme.distance.gutter.vertical.max,
              ),
            );
          }
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
