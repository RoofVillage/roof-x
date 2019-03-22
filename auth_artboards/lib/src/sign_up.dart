import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';

import 'phone_number.dart';
import 'challenge.dart';

class SignUpArtboard extends FormFloatingArtboard {
  @override
  String get title => "Create an account";

  @override
  String get submitButtonText => "Create";

  @override
  List<StreamableFormFieldData> get fieldData => [
        _nameFieldData,
        _emailFieldData,
        _passwordFieldData,
      ];

  final _nameFieldData = MediumFormTextFieldData(title: "Full name");
  final _emailFieldData = EmailFormTextFieldData();
  final _passwordFieldData = PasswordFormTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {
    FloatingArtboardNavigator.of(context).goTo(
        PhoneNumberArtboard(onSubmit: _phoneNumberDependentSubmit),
        context: context);
  }

  Future<void> _phoneNumberDependentSubmit(
      {@required String phoneNumber, @required BuildContext context}) async {
    // await User().create(
    //     email: _emailFieldData.value,
    //     name: _nameFieldData.value,
    //     password: _passwordFieldData.value,
    //     phoneNumber: phoneNumber);

    FloatingArtboardNavigator.of(context).goTo(
        AuthChallengeArtboard(
          phoneNumber: phoneNumber,
        ),
        context: context);
  }
}
