import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';

mixin LogInArtboardData implements FormBuilder {
  @override
  String get title => "Log in";

  @override
  String get auxiliaryDescription => "Forgot your password?";

  @override
  String get auxiliaryButtonText => "Reset password";

  @override
  String get submitButtonText => "Log in";

  submit(context) {
    return ChallengeCommands().create(
      hash: _usernameFieldData.value,
      phone: _passwordFieldData.value,
    );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      [_usernameFieldData, _passwordFieldData];

  final _usernameFieldData = FormEmailTextFieldData(title: "Email or phone");
  final _passwordFieldData = FormPasswordTextFieldData();
}
