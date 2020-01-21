import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:service_dashboard_artboard/index.dart';
import 'package:views/index.dart';

mixin ServicesArtboardData {
  String get title => "Your services";

  final Stream<UserServicesView> servicesView =
      UserServicesViewStore().fakeListen(
    UserServicesView(
      services: [
        UserServiceView(name: "Roof"),
        UserServiceView(name: "Food lion"),
      ],
    ),
  );

  final void Function(BuildContext) onServiceTap =
      (context) => ArtboardNavigator.of(context).goTo(
            ServiceDashboardVerticalFullscreenArtboard(),
          );
}
