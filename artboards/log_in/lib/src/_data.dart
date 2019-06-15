import 'dart:async';

import 'package:form_builder/index.dart';

mixin LogInArtboardBuilder implements FormBuilder {
  @override
  String get title => "Log in";

  @override
  String get auxiliaryDescription => "Forgot your password?";

  @override
  String get auxiliaryButtonText => "Reset password";

  @override
  String get submitButtonText => "Log in";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      [_usernameFieldData, _passwordFieldData];

  final _usernameFieldData = EmailFormTextFieldData(title: "Email or phone");
  final _passwordFieldData = PasswordFormTextFieldData();
}
