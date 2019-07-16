import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';

typedef Future<void> PhoneNumberDependentSubmit(
    {@required String phoneNumber, @required BuildContext context});
mixin PhoneNumberSignUpArtboardData implements FormBuilder {
  PhoneNumberDependentSubmit get onSubmit;

  @override
  String get title => "Enter your phone number";

  @override
  String get subtitle => "We'll send you a code to make sure it's you.";

  @override
  String get submitButtonText => "Send code";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      [_phoneNumberFieldData];

  final _phoneNumberFieldData = FormPhoneNumberTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {
    await onSubmit(phoneNumber: _phoneNumberFieldData.value, context: context);
  }
}
