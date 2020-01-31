import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';

class ServiceCommands extends CommandDomain {
  @override
  String get domain => "service";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future register({
    @required String serviceName,
  }) {
    return BlossmCommand(
      payload: {
        "name": serviceName,
      },
      route: "register",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }
}
