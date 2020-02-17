import 'package:auth_verify_code_artboard/index.dart';
import 'package:blossm_command/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:welcome_artboard/index.dart';

import 'token_storer.dart';

mixin DispatcherConfig {
  final String baseUrl = "core.staging.sm.network";

  final TokenStore tokenStore = SMTokenStore();

  final Function(BuildContext) redirectToWelcome =
      (BuildContext context) => ArtboardNavigator.of(context).goTo(
            WelcomeVerticalFullScreenArtboard(),
          );

  final Function(BuildContext) redirectToChallengeAnswer =
      (BuildContext context) => ArtboardNavigator.of(context).goTo(
            AuthVerifyCodeVerticalFloatingArtboard(),
          );
}
