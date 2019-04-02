import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:form/index.dart';

class ResetPasswordArtboard extends FormFloatingArtboard {
  @override
  String get title => "Reset password";

  @override
  String get subtitle => "We'll send you an email with a reset link.";

  @override
  String get submitButtonText => "Send";

  @override
  Future<List<StreamableFormFieldData>> get fieldData async =>
      [_emailFieldData];

  final _emailFieldData = EmailFormTextFieldData();

  @override
  Future<void> submit(BuildContext context) async {}
}
