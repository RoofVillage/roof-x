import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_vertical_floating_artboard_template/index.dart';
import 'package:challenge_artboard/index.dart';
import 'package:phone_number_sign_up_artboard/index.dart';
import 'package:navigator/index.dart';

import '_data.dart';

class SignUpVerticalFloatingArtboard extends FormVerticalFloatingArtboard
    with SignUpArtboardData {
  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(
      PhoneNumberSignUpVerticalFloatingArtboard(
          onSubmit: _phoneNumberDependentSubmit),
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
      ChallengeVerticalFloatingArtboard(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
