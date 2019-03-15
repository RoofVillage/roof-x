import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

class ResetPasswordArtboard extends FormFloatingArtboard {
  @override
  String get title => "Reset password";

  @override
  String get subtitle => "We'll send yu an email with a reset link.";

  @override
  String get submitButtonText => "Send";

  List<StreamableFormFieldData> get fieldData {
    final emailFieldData = FormTextFieldData(
        title: "Email", onChanged: (someString) => print("Email: $someString"));

    return [emailFieldData];
  }

  @override
  Future<void> submit(BuildContext context) {}
}
