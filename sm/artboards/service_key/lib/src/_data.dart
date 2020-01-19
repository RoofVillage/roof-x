import 'dart:async';

import 'package:views/index.dart';

mixin ServiceKeyArtboardData {
  Future<String> get serviceName async =>
      (await ServiceDashboardViewStore().fakeResponse(
        ServiceDashboardView(name: "Roof"),
      ))
          .name;

  Future<String> get serviceKey async =>
      (await ServiceKeyViewStore().fakeResponse(
        ServiceKeyView(key: "uniqueKey123"),
      ))
          .key;
}
