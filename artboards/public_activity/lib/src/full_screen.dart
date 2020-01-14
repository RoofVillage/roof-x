import 'package:button_builder/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:full_logo_table_vertical_full_screen_artboard_template/index.dart';
import 'package:sign_up_artboard/index.dart';
import 'package:navigation_icon_library/index.dart';

import '_data.dart';

class PublicActivityVerticalFullScreenArtboard
    extends FullLogoTableVerticalFullScreenArtboard
    with
        PublicActivityArtboardData,
        ButtonRowDockBuilder,
        PrimaryCenterButtonBuilder,
        SecondaryCenterButtonBuilder {
  List<Widget> buildActionButtons(BuildContext context) {
    final button1 = buildIconNavButton(
      context,
      iconReference: NavigationIcon.add,
      onTap: (context) {
        ArtboardNavigator.of(context).goTo(
          SignUpVerticalFloatingArtboard(),
        );
      },
    );

    final button2 = buildIconNavButton(
      context,
      iconReference: NavigationIcon.settings,
      onTap: (context) {
        ArtboardNavigator.of(context).goTo(
          PublicActivityVerticalFullScreenArtboard(),
        );
      },
    );

    final popButton = buildIconNavButton(
      context,
      iconReference: NavigationIcon.backArrow,
      onTap: (context) {
        ArtboardNavigator.of(context).pop(context);
      },
    );

    return [button1, button2, popButton];
  }

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        buildPrimaryCenterButton(
          context,
          onTap: (context) => print('login'),
          text: "Log in",
        ),
        buildPrimaryCenterButton(
          context,
          onTap: (context) => print('signup'),
          text: "Sign up",
        ),
      ];

  @override
  Widget buildDock(BuildContext context) => buildButtonRowDock(context);
}
