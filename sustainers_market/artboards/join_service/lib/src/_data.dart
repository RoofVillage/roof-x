import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:services_artboard/index.dart';

mixin CreateServiceArtboardData implements FormBuilder {
  @override
  String get title => "Create service";

  @override
  String get auxiliaryDescription => "Forgot your password?";

  @override
  String get auxiliaryButtonText => "Reset password";

  @override
  String get submitButtonText => "Create";

  @override
  submit(context) {
    // return ServiceCommands()
    //     .create(
    //   name: _serviceNameFieldData.value,
    // )
    //     .then(
    //   (response) {
    //     ArtboardNavigator.of(context).goTo(
    //       ServicesVerticalFloatingArtboard(),
    //     );
    //   },
    // );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _serviceNameFieldData,
      ];

  final _serviceNameFieldData = FormShortTextFieldData(
    title: "Name of service",
  );
}
