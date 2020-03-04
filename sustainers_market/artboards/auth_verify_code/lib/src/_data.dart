import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:services_artboard/index.dart';

mixin AuthVerifyCodeArtboardData implements FormBuilder {
  @override
  String get title => "Enter the code sent to your phone number";

  @override
  String get submitButtonText => "Submit";

  @override
  submit(context) async {
    await ChallengeCommands(context).answer(
      code: _serviceNameFieldData.value,
    );

    ArtboardNavigator.of(context).goTo(
      ServicesVerticalFloatingArtboard(),
    );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _serviceNameFieldData,
      ];

  final _serviceNameFieldData = FormShortTextFieldData(
    title: "Verification code",
    autofocus: true,
  );
}
