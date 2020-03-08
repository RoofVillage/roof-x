import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:log_in_artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:create_service_artboard/index.dart';
import 'package:register_artboard/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:spaced_column_builder/index.dart';

import '_data.dart';

class WelcomeVerticalFullScreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with
        WelcomeScreenArtboardData,
        ButtonRowDockBuilder,
        SpacedColumnBuilder,
        PrimaryCenterButtonBuilder,
        SecondaryCenterButtonBuilder {
  @override
  Widget buildBody(BuildContext context) {
    final theme = SemanticTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.gutter.horizontal.medium,
      ),
      child: Center(
        child: Text(
          "Welcome to Sustainer's Market",
          style: theme.typography.headingPrimary.textStyle(
            color: theme.color.text.generalPrimary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        buildPrimaryCenterButton(
          context,
          text: "Join service",
          onTap: () => ArtboardNavigator.of(context).goTo(
            CreateServiceVerticalFloatingArtboard(),
          ),
        ),
        buildPrimaryCenterButton(
          context,
          text: "Create service",
          onTap: () => ArtboardNavigator.of(context).goTo(
            CreateServiceVerticalFloatingArtboard(),
          ),
        ),
        buildSecondaryCenterButton(
          context,
          text: "Register",
          onTap: () => ArtboardNavigator.of(context).goTo(
            RegisterVerticalFloatingArtboard(),
          ),
        ),
        buildSecondaryCenterButton(
          context,
          text: "Log in",
          onTap: () => ArtboardNavigator.of(context).goTo(
            LogInVerticalFloatingArtboard(),
          ),
        ),
      ];

  @override
  Widget buildDock(BuildContext context) => buildSpacedColumn(
        context,
        children: dockButtons(context),
      );
}
