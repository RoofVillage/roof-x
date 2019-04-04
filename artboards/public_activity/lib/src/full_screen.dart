import 'package:flutter/material.dart';
import 'package:navigation/index.dart';
import 'package:full_screen_artboard_templates/index.dart';
import 'package:sign_up_artboard/index.dart';
import 'package:icon_library/index.dart';

import '_builder.dart';

class PublicActivityFullScreenArtboard extends FullLogoTableFullScreenArtboard
    with PublicActivityArtboardBuilder {
  List<Widget> buildActionButtons(BuildContext context) {
    final button1 = buildIconNavButton(context,
        iconReference: IconReference.addNav, onTap: (context) {
      ArtboardNavigator.of(context).goTo(SignUpFloatingArtboard());
    });

    final button2 = buildIconNavButton(context,
        iconReference: IconReference.settingsNav, onTap: (context) {
      ArtboardNavigator.of(context).goTo(PublicActivityFullScreenArtboard());
    });

    final popButton = buildIconNavButton(context,
        iconReference: IconReference.backArrowNav, onTap: (context) {
      ArtboardNavigator.of(context).pop(context);
    });

    return [button1, button2, popButton];
  }
}
