import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

import 'challenge.dart';

class PhoneNumberArtboard extends FormFloatingArtboard {
  @override
  String get title => "Enter your phone number";

  @override
  String get subtitle => "We'll send you a code to make sure it's you.";

  @override
  String get submitButtonText => "Send code";

  List<StreamableFormFieldData> get fieldData {
    final phoneNumberFieldData = PhoneNumberTextFieldData(
        onChanged: (someString) => print("Phone: $someString"));

    return [phoneNumberFieldData];
  }

  @override
  Future<void> submit(BuildContext context) {
    return ArtboardNavigator.of(context).goTo(
        AuthChallengeArtboard(
          phoneNumber: "9193571144",
        ),
        context: context);
  }
}
