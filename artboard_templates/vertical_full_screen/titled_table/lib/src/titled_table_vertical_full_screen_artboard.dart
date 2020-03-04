import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';

abstract class TitledVerticalFullTableScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        TitledNavBarBuilder {
  String get artboardTitle;

  String get artboardSubtitle;

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  @override
  Widget buildBody(BuildContext context) => buildTable(context);
  @override
  Widget buildNavBar(BuildContext context) => buildTitledNavBar(
        context,
        title: artboardTitle,
        subtitle: artboardSubtitle,
        navButton: artboardNavButton(context),
        actionButtons: artboardActionButtons(context),
      );
}
