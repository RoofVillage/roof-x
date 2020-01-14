import 'package:button/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:flutter/material.dart';
import 'package:button_stack_builder/index.dart';

import '_data.dart';

class PublicActivityVerticalFullScreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with PublicActivityArtboardData, ButtonStackBuilder {
  // List<Widget> buildActionButtons(BuildContext context) {
  //   final button1 = buildIconNavButton(
  //     context,
  //     iconReference: NavigationIcon.add,
  //     onTap: (context) {
  //       ArtboardNavigator.of(context).goTo(
  //         SignUpVerticalFloatingArtboard(),
  //       );
  //     },
  //   );

  //   final button2 = buildIconNavButton(
  //     context,
  //     iconReference: NavigationIcon.settings,
  //     onTap: (context) {
  //       ArtboardNavigator.of(context).goTo(
  //         PublicActivityVerticalFullScreenArtboard(),
  //       );
  //     },
  //   );

  //   final popButton = buildIconNavButton(
  //     context,
  //     iconReference: NavigationIcon.backArrow,
  //     onTap: (context) {
  //       ArtboardNavigator.of(context).pop(context);
  //     },
  //   );

  //   return [button1, button2, popButton];
  // }

  @override
  List<Widget> get buttonStackButtons => [
        RoofPrimaryCenterButton(
          onTap: (context) => print('login'),
          text: "I'm a roommate",
        ),
        RoofPrimaryCenterButton(
          onTap: (context) => print('login'),
          text: "I'm a tenant",
        ),
        RoofPrimaryCenterButton(
          onTap: (context) => print('login'),
          text: "I'm a landlord",
        ),
        RoofSecondaryCenterButton(
          onTap: (context) => print('login'),
          text: "Log in",
        ),
      ];

  @override
  Widget buildDock(BuildContext context) => buildButtonStack(context);
}
