import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';

import '../_utils/dispatcher_config.dart';

class ServiceCommands extends BlossmCommandDispatcher with DispatcherConfig {
  final BuildContext context;

  ServiceCommands(this.context);

  @override
  String get domain => "service";

  @override
  Future Function() get onTokenInvalid => () => redirectToWelcome(context);

  @override
  Future<void> Function() get onChallengeIssued =>
      () => redirectToChallengeAnswer(context);

  Future register({
    @required String serviceName,
  }) {
    return dispatch(
      route: "register",
      payload: {
        "name": serviceName,
      },
    );
  }
}
