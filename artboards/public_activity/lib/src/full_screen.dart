import 'package:button_builder/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:flutter/material.dart';
import 'package:standard_stack_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:sign_up_artboard/index.dart';
import 'package:x_small_icon_library/index.dart';

import '_data.dart';

class PublicActivityVerticalFullScreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with
        PublicActivityArtboardData,
        StandardStackBuilder,
        PrimaryCenterButtonBuilder {
  List<Widget> Function(BuildContext) get buildStandardStackButtons =>
      (BuildContext context) => [
            buildPrimaryCenterButton(
              context,
              onTap: (context) {
                ArtboardNavigator.of(context).goTo(
                  SignUpVerticalFloatingArtboard(),
                );
              },
              icon: XSmallIcon.house,
              text: "I'm a roommate",
            ),
            buildPrimaryCenterButton(
              context,
              onTap: (context) => print('login'),
              icon: XSmallIcon.house,
              text: "I'm a tenant",
            ),
            buildPrimaryCenterButton(
              context,
              onTap: (context) => print('login'),
              icon: XSmallIcon.house,
              text: "I'm a landlord",
            ),
            buildPrimaryCenterButton(
              context,
              onTap: (context) => print('login'),
              icon: XSmallIcon.house,
              text: "Log in",
            ),
          ];

  @override
  Widget buildDock(BuildContext context) => buildStandardStack(
        context,
        children: buildStandardStackButtons(context),
      );
}
