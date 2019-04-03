import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:challenge_artboard/index.dart';
import 'package:phone_number_sign_up_artboard/index.dart';
import 'package:navigation/index.dart';

import '_builder.dart';

class SignUpFloatingArtboard extends FormFloatingArtboard
    with SignUpArtboardBuilder {
  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(
      PhoneNumberSignUpFloatingArtboard(onSubmit: _phoneNumberDependentSubmit),
    );
  }

  Future<void> _phoneNumberDependentSubmit(
      {@required String phoneNumber, @required BuildContext context}) async {
    // await User().create(
    //     email: _emailFieldData.value,
    //     name: _nameFieldData.value,
    //     password: _passwordFieldData.value,
    //     phoneNumber: phoneNumber);

    ArtboardNavigator.of(context).goTo(
      ChallengeFloatingArtboard(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
