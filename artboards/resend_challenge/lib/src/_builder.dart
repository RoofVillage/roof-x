import 'dart:async';

import 'package:form_builder/index.dart';

mixin ResentChallengeArtboardBuilder implements FormBuilder {
  @override
  String get title => "Resend verification text message";

  @override
  String get submitButtonText => "Send code";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async =>
      [_phoneNumberFieldData];

  final _phoneNumberFieldData = PhoneNumberFormTextFieldData();
}
