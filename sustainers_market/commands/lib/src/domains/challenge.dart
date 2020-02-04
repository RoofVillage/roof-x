import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';

import '../_utils/dispatcher_config.dart';

class ChallengeCommands extends BlossmCommandDispatcher with DispatcherConfig {
  final BuildContext context;

  ChallengeCommands(this.context);

  @override
  String get domain => "session";

  @override
  Future Function() get onTokenInvalid => () => redirectToWelcome(context);

  Future issue({
    @required String phoneNumber,
  }) {
    return dispatch(
      route: "issue",
      payload: {
        "phone": phoneNumber,
      },
    );
  }

  Future answer({
    @required String code,
  }) {
    return dispatch(
      route: "answer",
      payload: {
        "code": code,
      },
    );
  }
}
