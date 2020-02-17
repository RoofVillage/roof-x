import 'package:blossm_command/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:public_activity_artboard/index.dart';

import 'token_storer.dart';

mixin DispatcherConfig {
  final String baseUrl = "core.staging.sm.network";

  final TokenStore tokenStore = RoofTokenStore();

  final Function(BuildContext) redirectToWelcome =
      (BuildContext context) => ArtboardNavigator.of(context).goTo(
            PublicActivityVerticalFullScreenArtboard(),
          );

  final Function(BuildContext) redirectToChallengeAnswer =
      (BuildContext context) {
    // TODO implement redirectToChallengeAnswer
    print('redirect to challenge answer!');
    return Future.value();
  };
}
