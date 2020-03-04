import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:form_validation_exception/index.dart';
import 'package:navigator/index.dart';
import 'package:services_artboard/index.dart';

mixin CreateServiceArtboardData implements FormBuilder {
  @override
  String get title => "Create service";

  @override
  String get submitButtonText => "Create";

  @override
  Future<void> validate() {
    if (_serviceNameFieldData.value.isEmpty) {
      throw FormValidationException.emptyNotAllowed(
        fieldTitle: _serviceNameFieldData.title,
      );
    }
    return Future.value();
  }

  @override
  Future<void> submit(context) async {
    final serviceName = _serviceNameFieldData.value;

    await ServiceCommands(context).register(
      serviceName: serviceName,
    );

    ArtboardNavigator.of(context).goTo(
      ServicesVerticalFloatingArtboard(
        pendingServiceNames: [
          serviceName,
        ],
      ),
    );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _serviceNameFieldData,
      ];

  final _serviceNameFieldData = FormShortTextFieldData(
    title: "Service Name",
    placeholder: "Flo's Flowers",
    autofocus: true,
  );
}
