import 'dart:async';

import 'package:form_builder/index.dart';

mixin ChallengeArtboardBuilder implements FormBuilder {
  String get phoneNumber;

  @override
  String get title => "Confirm";

  @override
  String get subtitle {
    final last4 = phoneNumber.substring(phoneNumber.length - 4);

    return "A confirmation code was sent to your phone number ending in " +
        last4 +
        ".";
  }

  @override
  String get submitButtonText => "Submit";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async => [_codeFieldData];

  final _codeFieldData = ShortFormTextFieldData(title: "Enter code");
}
