import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';

abstract class TitledTableInputDockVerticalFullScreenArtboard
    extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledNavBarBuilder {
  @override
  Widget buildBody(BuildContext context) => buildTable(context);
  @override
  Widget buildNavBar(BuildContext context) => buildTitledNavBar(context);
  @override
  Widget buildDock(BuildContext context) => buildInputDock(context);
}
