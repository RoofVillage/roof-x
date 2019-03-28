import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';

import 'phone_number.dart';
import 'challenge.dart';

class DateTimeArtboard extends FormFloatingArtboard<DateTime> {
  @override
  Future<void> submit(BuildContext context) {
    return null;
  }

  @override
  String get submitButtonText => null;

  @override
  String get title => null;

  @override
  get result => DateTime.now();
}

class SignUpArtboard extends FormFloatingArtboard {
  @override
  String get title => "Create an account";

  @override
  String get submitButtonText => "Create";

  @override
  List<StreamableFormFieldData> get fieldData => [
        _temp2,
        _nameFieldData,
        _emailFieldData,
        _passwordFieldData,
      ];

  final _nameFieldData = MediumFormTextFieldData(title: "Full name");
  final _emailFieldData = EmailFormTextFieldData();
  final _passwordFieldData = PasswordFormTextFieldData();
  final _temp = CurrencyFormTextFieldData();
  final _temp2 = FormSwitchData(title: "Toggle field");

  @override
  void setup(BuildContext context) {
    super.setup(context);
    // _temp2.addOnChangedListener(_toggleField);
  }

  @override
  Future<DateTime> goToDatePicker(BuildContext context) async {
    final time = await FloatingArtboardNavigator.of(context)
        .goTo<DateTime>(DateTimeArtboard(), context: context);
    print("TIME $time");
  }

  void _toggleField(bool showing) {
    if (showing) {
      form.insertFieldDataAfter(_temp, _temp2);
    } else {
      form.removeFieldData(_temp);
    }
  }

  @override
  Future<void> submit(BuildContext context) async {
    FloatingArtboardNavigator.of(context).goTo(
        PhoneNumberArtboard(onSubmit: _phoneNumberDependentSubmit),
        context: context);
  }

  Future<void> _phoneNumberDependentSubmit(
      {@required String phoneNumber, @required BuildContext context}) async {
    // await User().create(
    //     email: _emailFieldData.value,
    //     name: _nameFieldData.value,
    //     password: _passwordFieldData.value,
    //     phoneNumber: phoneNumber);

    FloatingArtboardNavigator.of(context).goTo(
        AuthChallengeArtboard(
          phoneNumber: phoneNumber,
        ),
        context: context);
  }
}
