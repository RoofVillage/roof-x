import 'package:commands/src/utils/device_info.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';
import 'package:flutter/material.dart';

class SessionCommands extends CommandDomain {
  @override
  String get domain => "session";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future start() async {
    final deviceInfo = await DeviceInfo.read();

    return BlossmCommand(
      payload: {
        "device": deviceInfo.toMap(),
      },
      route: "start",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }

  Future save({
    @required String phoneNumber,
  }) async {
    return BlossmCommand(
      payload: {
        "phone": phoneNumber,
      },
      route: "save",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }

  Future logout() async {
    return BlossmCommand(
      payload: {},
      route: "logout",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }

  Future switchContext({
    @required String context,
  }) async {
    return BlossmCommand(
      payload: {
        "context": context,
      },
      route: "switch-context",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }
}
