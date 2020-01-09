import 'package:commands/src/blossom_command.dart';
import 'package:commands/src/blossom_domain.dart';
import 'package:flutter/material.dart';

class ChallengeDomain extends BlossomDomain {
  @override
  String get name => "challenge";

  Future create({
    @required String phone,
    @required String hash,
  }) {
    return BlossomCommand(
      payload: {
        phone: phone,
        hash: hash,
      },
      address: "create",
      domain: name,
    ).issue();
  }
}
