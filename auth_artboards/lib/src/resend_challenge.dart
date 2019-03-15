import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

import 'log_in.dart';

class ResentChallengeArtboard extends FormFloatingArtboard {
  @override
  String get title => "Resend verification text message";

  @override
  String get submitButtonText => "Send code";

  List<StreamableFormFieldData> get fieldData {
    final phoneNumberFieldData = PhoneNumberTextFieldData(
        onChanged: (someString) => print("Phone: $someString"));

    return [phoneNumberFieldData];
  }

  @override
  Future<void> submit(BuildContext context) {
    return ArtboardNavigator.of(context)
        .goTo(LogInArtboard(), context: context);
  }
}
