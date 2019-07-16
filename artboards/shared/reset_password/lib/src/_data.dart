import 'dart:async';

import 'package:form_builder/index.dart';

mixin ResetPasswordArtboardData implements FormBuilder {
  @override
  String get title => "Reset password";

  @override
  String get subtitle => "We'll send you an email with a reset link.";

  @override
  String get submitButtonText => "Send";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      [_emailFieldData];

  final _emailFieldData = FormEmailTextFieldData();
}
