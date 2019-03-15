import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

import 'phone_number.dart';

class SignUpArtboard extends FormFloatingArtboard {
  @override
  String get title => "Create an account";

  @override
  String get submitButtonText => "Create";

  List<StreamableFormFieldData> get fieldData {
    final nameFieldData = FormTextFieldData(
        title: "Full name",
        onChanged: (someString) => print("Full name: $someString"));

    final emailFieldData = EmailTextFieldData(
        onChanged: (someString) => print("Email: $someString"));

    final passwordFieldData = PasswordTextFieldData(
        onChanged: (someString) => print("Password: $someString"));

    return [nameFieldData, emailFieldData, passwordFieldData];
  }

  @override
  Future<void> submit(BuildContext context) {
    ArtboardNavigator.of(context).goTo(PhoneNumberArtboard(), context: context);

    // User()
    //     .create(name: "Tony hawk", email: "tony@hawk.io", password: "T0nYRocks");
  }
}
