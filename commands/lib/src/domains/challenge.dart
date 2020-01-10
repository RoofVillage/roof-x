import 'package:flutter/material.dart';
import 'package:blossm_command/index.dart';
import 'package:commands/src/utils/index.dart';

class ChallengeCommands extends CommandDomain {
  @override
  String get domain => "challenge";

  @override
  String get baseUrl => coreStagingBaseUrl;

  Future create({
    @required String phone,
    @required String hash,
  }) {
    return BlossmCommand(
      payload: {
        phone: phone,
        hash: hash,
      },
      route: "create",
      domain: domain,
      baseUrl: baseUrl,
    ).issue();
  }
}
