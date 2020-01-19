import 'package:button/index.dart';
import 'package:button_row_dock_builder/index.dart';
import 'package:commands/index.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:flutter/material.dart';

import '_data.dart';

class ServiceKeyVerticalFullscreenArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with ServiceKeyArtboardData, ButtonRowDockBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              child: Text('Service created: $serviceName'),
              padding: EdgeInsets.only(bottom: 50),
            ),
            RoofSecondaryCenterButton(
              text: "Get key",
              onTap: getKey,
            )
          ],
        ),
      ),
    );
  }

  @override
  List<Widget> Function(BuildContext) get dockButtons => (context) => [
        RoofPrimaryCenterButton(
          text: "Save",
          onTap: (context) => ServiceCommands().save(),
        )
      ];

  @override
  Widget buildDock(BuildContext context) {
    return buildButtonRowDock(context);
  }
}
