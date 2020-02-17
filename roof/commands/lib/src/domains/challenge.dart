import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';

import '../_utils/dispatcher_config.dart';

class ChallengeCommands extends BlossmCommandDispatcher with DispatcherConfig {
  final BuildContext context;

  ChallengeCommands(this.context);

  @override
  String get domain => "challenge";

  @override
  Future Function() get onTokenInvalid => () => redirectToWelcome(context);

  @override
  Future<void> Function() get onChallengeIssued =>
      () => redirectToChallengeAnswer(context);

  Future create({
    @required String phone,
    @required String hash,
  }) {
    return dispatch(
      route: "create",
      payload: {
        phone: phone,
        hash: hash,
      },
    );
  }
}
