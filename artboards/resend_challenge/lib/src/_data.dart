import 'dart:async';

import 'package:form_builder/index.dart';

mixin ResentChallengeArtboardData implements FormBuilder {
  @override
  String get title => "Resend verification text message";

  @override
  String get submitButtonText => "Send code";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      [_phoneNumberFieldData];

  final _phoneNumberFieldData = FormPhoneNumberTextFieldData();
}
