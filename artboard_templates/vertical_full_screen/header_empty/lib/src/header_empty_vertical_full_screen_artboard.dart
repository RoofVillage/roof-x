import 'package:flutter/material.dart';
import 'package:nav_header_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';

abstract class HeaderEmptyVerticalFullScreenArtboard extends StatefulWidget
    with VerticalFullScreenArtboard, NavHeaderBuilder, Artboard {
  String get artboardTitle;

  Widget artboardBody(BuildContext context);

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    return Column(children: [
      buildNavHeader(
        context,
        title: artboardTitle,
        navButton: artboardNavButton(context),
        actionButtons: artboardActionButtons(context),
      ),
      artboardBody(context),
    ]);
  }
}
