import 'package:flutter/material.dart';
import 'package:header_builder/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:roof_theme/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:scroll_view_vertical_full_screen_artboard_template/index.dart';
import 'package:small_icon_library/index.dart';
import 'package:spaced_sliver_list_builder/index.dart';
import 'package:table_cell_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:icon_button_builder/index.dart';

import '_data.dart';

class UserSettingsVerticalFullscreenArtboard
    extends ScrollViewVerticalFullScreenArtboard
    with
        UserSettingsArtboardData,
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
  UserSettingsVerticalFullscreenArtboard();

  String get artboardTitle => "Your settings";

  Widget artboardNavButton(BuildContext context) => buildNavIconButton(
        iconReference: NavigationIcon.backArrow,
        onTap: () => ArtboardNavigator.of(context).pop(),
      );

  @override
  List<Widget> artboardActionButtons(BuildContext context) => [
        buildSecondaryActionIconButton(
          iconReference: SemanticTheme.of(context).currentThemeOption ==
                  RoofThemeOption.dark
              ? SmallIcon.boxUnchecked
              : SmallIcon.boxChecked,
          onTap: () => _switchCurrentThemeOption(context),
        )
      ];

  _switchCurrentThemeOption(BuildContext context) {
    final theme = SemanticTheme.of(context);

    SemanticTheme.setThemeOption(
      context,
      themeOption: theme.currentThemeOption == RoofThemeOption.dark
          ? RoofThemeOption.light
          : RoofThemeOption.dark,
    );
  }

  // Widget balanceSection(BuildContext context) => buildViewStreamBuilder(
  //       context,
  //       stream: walletOverviewStream,
  //       loading: SliverToBoxAdapter(child: Text('loading')),
  //       empty: SliverToBoxAdapter(child: Text('empty')),
  //       child: (context, WalletOverview snapshot) {},
  //     );

  Widget accountActions(BuildContext context) => buildSpacedSliverList(
        children: [
          buildSecondaryCenterButton(
            context,
            text: "Log out",
            onTap: () => print('logout'),
          ),
          buildSecondaryCenterButton(
            context,
            text: "Delete account",
            onTap: () => print('delete acct'),
          )
        ],
      );

  @override
  List<Widget> children(BuildContext context) {
    return [accountActions(context)];
  }
}
