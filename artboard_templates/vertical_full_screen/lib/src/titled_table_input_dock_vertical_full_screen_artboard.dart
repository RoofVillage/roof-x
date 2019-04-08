import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';

import '_vertical_full_screen_scaffold.dart';
import 'full_screen_artboard.dart';

abstract class TitledTableInputDockVerticalFullScreenArtboard
    extends VerticalFullScreenArtboard
    with TableBuilder, InputDockBuilder, TitledNavBarBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return VerticalFullScreenScaffold(
      navBar: buildTitledNavBar(context),
      body: buildTable(context),
      dock: buildInputDock(context),
    );
  }
}
