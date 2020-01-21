import 'dart:async';

import 'package:views/index.dart';

mixin ServiceDashboardArtboardData {
  final Stream<ServiceDashboardView> service =
      ServiceDashboardViewStore().fakeListen(
    ServiceDashboardView(
      name: "Roof",
      keys: [
        "key123",
        "key456",
      ],
    ),
  );
}
