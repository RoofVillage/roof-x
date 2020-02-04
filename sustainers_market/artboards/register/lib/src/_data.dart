import 'dart:async';

import 'package:auth_verify_code_artboard/index.dart';
import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';

mixin RegisterArtboardData implements FormBuilder {
  @override
  String get title => "Register";

  @override
  String get submitButtonText => "Submit";

  @override
  submit(context) async {
    await SessionCommands(context).save(
      phoneNumber: _phoneNumberFieldData.value,
    );

    ArtboardNavigator.of(context).goTo(
      AuthVerifyCodeVerticalFloatingArtboard(
        phoneNumber: _phoneNumberFieldData.value,
      ),
    );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _phoneNumberFieldData,
      ];

  final _phoneNumberFieldData = FormPhoneNumberTextFieldData(
    title: "Phone number",
    autofocus: true,
  );
}
