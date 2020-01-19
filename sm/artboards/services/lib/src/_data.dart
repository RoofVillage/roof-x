import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:service_key_artboard/index.dart';
import 'package:views/index.dart';

mixin ServicesArtboardData {
  String get title => "Your services";

  Future<List<UserServiceView>> get services async =>
      (await UserServicesViewStore().fakeResponse(
        UserServicesView(
          services: [
            UserServiceView(name: "Roof"),
            UserServiceView(name: "Food lion"),
          ],
        ),
      ))
          .services;

  final void Function(BuildContext) onServiceTap = (context) =>
      ArtboardNavigator.of(context)
          .goTo(ServiceKeyVerticalFullscreenArtboard());
}
