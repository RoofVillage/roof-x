import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';

import '_scaffolds/full_screen_with_nav_and_dock.dart';
import 'full_screen_artboard.dart';

abstract class TitledTableInputDockFullScreenArtboard extends StatefulWidget
    with
        FullScreenArtboard,
        TableBuilder,
        InputDockBuilder,
        TitledNavBarBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNavAndDock(
      navBar: buildTitledNavBar(context),
      body: buildTable(context),
      dock: buildInputDock(context),
    );
  }
}
