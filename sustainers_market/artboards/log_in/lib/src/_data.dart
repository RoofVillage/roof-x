import 'dart:async';

import 'package:auth_verify_code_artboard/index.dart';
import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';

mixin LogInArtboardData implements FormBuilder {
  @override
  String get title => "Log in";

  @override
  String get submitButtonText => "Log in";

  @override
  submit(context) async {
    await ChallengeCommands().issue(
      phoneNumber: _phoneNumberFieldData.value,
    );

    ArtboardNavigator.of(context).goTo(
      AuthVerifyCodeVerticalFloatingArtboard(),
    );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _phoneNumberFieldData,
      ];

  final _phoneNumberFieldData = FormPhoneNumberTextFieldData(
    title: "Phone number",
  );
}
