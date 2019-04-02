import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation/index.dart';
import 'package:form/index.dart';

import 'reset_password.dart';

class LogInArtboard extends FormFloatingArtboard {
  @override
  String get title => "Log in";

  @override
  String get auxiliaryDescription => "Forgot your password?";

  @override
  String get auxiliaryButtonText => "Reset password";

  @override
  String get submitButtonText => "Log in";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async =>
      [_usernameFieldData, _passwordFieldData];

  final _usernameFieldData = EmailFormTextFieldData(title: "Email or phone");
  final _passwordFieldData = PasswordFormTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(ResetPasswordArtboard());
  }
}
