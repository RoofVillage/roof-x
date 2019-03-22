import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:challenge_artboards/index.dart';

import 'resend_challenge.dart';

class AuthChallengeArtboard extends ChallengeArtboard {
  @override
  String get auxiliaryDescription => "Didn't get one?";

  @override
  String get auxiliaryButtonText => "Send again";

  @override
  Future<void> submit(BuildContext context) async {
    FloatingArtboardNavigator.of(context)
        .goTo(ResentChallengeArtboard(), context: context);
  }

  AuthChallengeArtboard({@required String phoneNumber})
      : super(phoneNumber: phoneNumber);
}
