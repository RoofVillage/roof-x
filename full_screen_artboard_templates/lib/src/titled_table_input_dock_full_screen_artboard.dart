import 'package:flutter/material.dart';
import 'package:navigation_artboard_mixin/index.dart';
import 'package:table_artboard_mixin/index.dart';
import 'package:input_dock_artboard_mixin/index.dart';

import 'widgets/index.dart';

import 'full_screen_artboard.dart';

abstract class TitledTableInputDockFullScreenArtboard extends FullScreenArtboard
    with TableArtboard, InputDockArtboard, TitledNavBarArtboard {
  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNavAndDock(
        navBar: navBar,
        body: buildTable(context),
        dock: buildInputDock(context));
  }
}
