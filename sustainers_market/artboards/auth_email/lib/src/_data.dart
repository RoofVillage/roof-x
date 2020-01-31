import 'dart:async';

import 'package:commands/index.dart';
import 'package:form_builder/index.dart';
import 'package:navigator/index.dart';

mixin AuthEmailArtboardData implements FormBuilder {
  @override
  String get title => "Create service";

  @override
  String get subtitle => null;

  @override
  String get submitButtonText => "Create";

  @override
  submit(context) async {
    // await ServiceCommands().create(
    //   name: _serviceNameFieldData.value,
    // );
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _serviceNameFieldData,
      ];

  final _serviceNameFieldData = FormEmailTextFieldData(
    title: "Email address",
    placeholder: "name@email.com",
    autofocus: true,
  );
}
