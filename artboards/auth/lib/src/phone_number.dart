import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_builder/index.dart';

typedef Future<void> PhoneNumberDependentSubmit(
    {@required String phoneNumber, @required BuildContext context});

class PhoneNumberArtboard extends FormFloatingArtboard {
  final PhoneNumberDependentSubmit onSubmit;

  @override
  String get title => "Enter your phone number";

  @override
  String get subtitle => "We'll send you a code to make sure it's you.";

  @override
  String get submitButtonText => "Send code";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async =>
      [_phoneNumberFieldData];

  final _phoneNumberFieldData = PhoneNumberFormTextFieldData();

  PhoneNumberArtboard({@required this.onSubmit});

  @override
  Future<void> submit(BuildContext context) async {
    await onSubmit(phoneNumber: _phoneNumberFieldData.value, context: context);
  }
}
