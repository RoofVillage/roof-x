import 'dart:async';

import 'package:commands/index.dart';
import 'package:views/index.dart';

mixin ServiceKeyArtboardData {
  Future<String> get serviceName async =>
      (await ServiceDashboardViewStore().stub(
        ServiceDashboardView(name: "Roof"),
      ))
          .name;

  final getKey = (context) => {
        // return ServiceCommands().create(
        //   name: _serviceNameFieldData.value,
        // );
        print('submit')
      };
}
