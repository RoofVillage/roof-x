import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:full_logo_table_vertical_full_screen_artboard_template/index.dart';
import 'package:sign_up_artboard/index.dart';
import 'package:icon_library/index.dart';

import '_builder.dart';

class PublicActivityVerticalFullScreenArtboard
    extends FullLogoTableVerticalFullScreenArtboard
    with PublicActivityArtboardBuilder {
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
}
