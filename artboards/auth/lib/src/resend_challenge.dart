import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation/index.dart';
import 'package:form/index.dart';

import 'log_in.dart';

class ResentChallengeArtboard extends FormFloatingArtboard {
  @override
  String get title => "Resend verification text message";

  @override
  String get submitButtonText => "Send code";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async =>
      [_phoneNumberFieldData];

  final _phoneNumberFieldData = PhoneNumberFormTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(LogInArtboard());
  }
}
