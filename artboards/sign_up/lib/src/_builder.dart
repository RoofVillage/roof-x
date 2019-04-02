import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:challenge_artboard/index.dart';
import 'package:phone_number_sign_up_artboard/index.dart';
import 'package:navigation/index.dart';

mixin SignUpArtboardBuilder implements FormBuilder {
  @override
  String get title => "Create an account";

  @override
  String get submitButtonText => "Create";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async => [
        _temp3,
        _nameFieldData,
        _emailFieldData,
        _passwordFieldData,
      ];

  final _nameFieldData = MediumFormTextFieldData(title: "Full name");
  final _emailFieldData = EmailFormTextFieldData();
  final _passwordFieldData = PasswordFormTextFieldData();
  final _temp = CurrencyFormTextFieldData();
  final _temp2 = FormSwitchData(title: "Toggle field");
  final _temp3 = FormDateFieldData(title: "Sup");

  @override
  void setupFields(BuildContext context,
      {List<StreamableFormFieldData> fieldData}) {
    // _temp2.addOnChangedListener(_toggleField);
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
    ArtboardNavigator.of(context).goTo(
      PhoneNumberSignUpFloatingArtboard(onSubmit: _phoneNumberDependentSubmit),
    );
  }

  Future<void> _phoneNumberDependentSubmit(
      {@required String phoneNumber, @required BuildContext context}) async {
    // await User().create(
    //     email: _emailFieldData.value,
    //     name: _nameFieldData.value,
    //     password: _passwordFieldData.value,
    //     phoneNumber: phoneNumber);

    ArtboardNavigator.of(context).goTo(
      ChallengeFloatingArtboard(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
