import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:services_artboard/index.dart';

mixin CreateServiceArtboardData implements FormBuilder {
  @override
  String get title => "Create service";

  @override
  String get submitButtonText => "Create";

  @override
  submit(context) async {
    await ServiceCommands().register(
      serviceName: _serviceNameFieldData.value,
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
    title: "Service Name",
    placeholder: "Flo's Flowers",
    autofocus: true,
  );
}
