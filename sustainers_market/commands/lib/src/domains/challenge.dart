import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';

class ChallengeCommands extends CommandDomain {
  @override
  String get domain => "challenge";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future issue({
    @required String phoneNumber,
  }) {
    return BlossmCommand(
      payload: {
        "phone": phoneNumber,
      },
      route: "issue",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }

  Future answer({
    @required String code,
  }) {
    return BlossmCommand(
      payload: {
        "code": code,
      },
      route: "answer",
      domain: domain,
      baseUrl: baseUrl,
      tokenStore: tokenStore,
    ).issue();
  }
}
