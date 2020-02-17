import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';

import '../_utils/dispatcher_config.dart';
import '../_utils/device_info.dart';

class SessionCommands extends BlossmCommandDispatcher with DispatcherConfig {
  final BuildContext context;

  SessionCommands(this.context);

  @override
  String get domain => "challenge";

  @override
  Future Function() get onTokenInvalid => () => redirectToWelcome(context);

  @override
  Future<void> Function() get onChallengeIssued =>
      () => redirectToChallengeAnswer(context);

  Future start() async {
    // final _hasToken = await tokenStore.readSessionToken() != null;
    // if (_hasToken) return;

    final deviceInfo = await DeviceInfo.read();

    return dispatch(
      route: "start",
      payload: {
        "device": deviceInfo.toMap(),
      },
    );
  }
}
