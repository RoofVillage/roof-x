import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:log_in_artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:create_service_artboard/index.dart';

import '_data.dart';

class WelcomeVerticalFullScreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with
        WelcomeScreenArtboardData,
        ButtonRowDockBuilder,
        PrimaryCenterButtonBuilder,
        SecondaryCenterButtonBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to Sustainer's Market",
        style: TextStyle(
          color: Colors.white30,
          fontSize: 60,
          fontWeight: FontWeight.w900,
          fontFamily: 'Azo',
        ),
      ),
    );
  }

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        buildPrimaryCenterButton(
          context,
          text: "Create service",
          onTap: (context) => ArtboardNavigator.of(context).goTo(
            CreateServiceVerticalFloatingArtboard(),
          ),
        ),
        buildSecondaryCenterButton(
          context,
          text: "Log in",
          onTap: (context) => ArtboardNavigator.of(context).goTo(
            LogInVerticalFloatingArtboard(),
          ),
        ),
      ];

  @override
  Widget buildDock(BuildContext context) => buildButtonRowDock(context);
}
