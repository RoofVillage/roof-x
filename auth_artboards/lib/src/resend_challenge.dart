import 'dart:async';

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

  @override
  List<StreamableFormFieldData> get fieldData => [_phoneNumberFieldData];

  final _phoneNumberFieldData = PhoneNumberFormTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(LogInArtboard(), context: context);
  }
}
