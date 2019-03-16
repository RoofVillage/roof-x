import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:challenge_artboards/index.dart';

import 'resend_challenge.dart';

class AuthChallengeArtboard extends ChallengeArtboard {
  @override
  Future<void> submit(BuildContext context) {
    return ArtboardNavigator.of(context)
        .goTo(ResentChallengeArtboard(), context: context);
  }

  AuthChallengeArtboard({@required String phoneNumber})
      : super(phoneNumber: phoneNumber);
}
