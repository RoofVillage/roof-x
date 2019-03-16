import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

class ChallengeArtboard extends FormFloatingArtboard {
  final String phoneNumber;

  @override
  String get title => "Confirm";

  @override
  String get subtitle {
    final last4 = phoneNumber.substring(phoneNumber.length - 4);

    return "A confirmation code was sent to your phone number ending in " +
        last4 +
        ".";
  }

  @override
  String get submitButtonText => "Submit";

  @override
  List<StreamableFormFieldData> get fieldData => [_codeFieldData];

  final _codeFieldData = ShortFormTextFieldData(title: "Enter code");

  ChallengeArtboard({this.phoneNumber});

  @override
  Future<void> submit(BuildContext context) async {
    return null;
  }
}
