import 'package:flutter/material.dart';
import 'package:balance_actions_artboard/index.dart';
import 'package:header_builder/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:scroll_view_vertical_full_screen_artboard_template/index.dart';
import 'package:small_icon_library/index.dart';
import 'package:spaced_sliver_list_builder/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:choose_wallet_verification_type_artboard/index.dart';
import 'package:button_builder/index.dart';
import 'package:icon_button_builder/index.dart';
import 'package:dwolla_types/index.dart';

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
        SectionHeaderBuilder,
        NavIconButtonBuilder,
        ActionIconButtonBuilder,
        SecondaryCenterButtonBuilder,
        SpacedSliverListBuilder {
  final String walletName;

  WalletDashboardVerticalFullscreenArtboard(this.walletName);

  String get artboardTitle => walletName;

  Widget artboardNavButton(BuildContext context) => buildNavIconButton(
        iconReference: NavigationIcon.backArrow,
        onTap: () => ArtboardNavigator.of(context).pop(),
      );

  List<Widget> artboardActionButtons(BuildContext context) => [
        buildSecondaryActionIconButton(
          iconReference: SmallIcon.settings,
          onTap: () => print('settings'),
        )
      ];

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

          if (snapshot.status == WalletVerificationStatus.verified) {
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
              case WalletVerificationStatus.verified:
                break;
              case WalletVerificationStatus.unverified:
                alertType = AlertType.neutral;
                statusAlertText = "Verify your wallet";
                break;
              case WalletVerificationStatus.retry:
                alertType = AlertType.warn;
                statusAlertText =
                    "We need some more info to finish your verification.";
                break;
              case WalletVerificationStatus.document:
                alertType = AlertType.warn;
                statusAlertText =
                    "Please upload a document to finish your identity verification.";
                break;
              case WalletVerificationStatus.suspended:
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

            final newTransferButton = buildSecondaryCenterButton(
              context,
              onTap: () => print('new transfer'),
              icon: XSmallIcon.add,
              text: "New transfer",
            );

            sliverWidgets.add(newTransferButton);

            return buildSpacedSliverList(
              children: sliverWidgets,
              horizontalGutter: horizontalGutter(context),
            );
          }
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
                sender: transfer.sender,
                receiver: transfer.receiver,
                transferStatus: transfer.transferStatus,
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
      balanceSection(context),
      recentTransfersSection(context),
    ];
  }
}
