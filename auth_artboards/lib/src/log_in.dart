import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

import 'reset_password.dart';

class LogInArtboard extends FormFloatingArtboard {
  @override
  String get title => "Log in";

  @override
  String get submitButtonText => "Log in";

  List<StreamableFormFieldData> get fieldData {
    final usernameFieldData = EmailTextFieldData(
        title: "Email or phone",
        onChanged: (someString) => print("Username: $someString"));

    final passwordFieldData = PasswordTextFieldData(
        onChanged: (someString) => print("Password: $someString"));

    return [usernameFieldData, passwordFieldData];
  }

  @override
  Future<void> submit(BuildContext context) {
    return ArtboardNavigator.of(context)
        .goTo(ResetPasswordArtboard(), context: context);
  }
}
