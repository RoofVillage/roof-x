import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';

import 'phone_number.dart';
import 'challenge.dart';

class SignUpArtboard extends FormFloatingArtboard {
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
  void setup(BuildContext context, {List<StreamableFormFieldData> fieldData}) {
    super.setup(context, fieldData: fieldData);
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
      PhoneNumberArtboard(onSubmit: _phoneNumberDependentSubmit),
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
      AuthChallengeArtboard(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
