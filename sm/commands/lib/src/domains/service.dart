import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';

class ServiceCommands extends CommandDomain {
  @override
  String get domain => "challenge";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future create({
    @required String name,
  }) {
    return BlossmCommand(
      payload: {
        "name": name,
      },
      route: "create",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }

  Future save() {
    return BlossmCommand(
      payload: {},
      route: "save",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }
}
