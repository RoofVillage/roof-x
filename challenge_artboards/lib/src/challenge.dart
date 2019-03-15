import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

class ChallengeArtboard extends FormFloatingArtboard {
  final String phoneNumber;

  @override
  String get title => "Confirm";

  @override
  String get submitButtonText {
    final last4 = phoneNumber.substring(phoneNumber.length - 4);

    return "A confirmation code was sent to your phone number ending in " +
        last4 +
        ".";
  }

  List<StreamableFormFieldData> get fieldData {
    final codeFieldData = FormTextFieldData(
        title: "Enter code",
        onChanged: (someString) => print("Code: $someString"));

    return [codeFieldData];
  }

  ChallengeArtboard({this.phoneNumber});

  @override
  Future<void> submit(BuildContext context) {
    return null;
  }
}
