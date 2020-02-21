import 'package:flutter/material.dart';
import 'package:page_header_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:nav_bar_builder/index.dart';

abstract class HeaderEmptyVerticalFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        PageHeaderBuilder,
        Artboard,
        AnimatedTitleNavBarBuilder {
  String get artboardTitle;

  Widget artboardBody(BuildContext context);

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  @override
  bool get provideInheritedScrollController => true;

  @override
  Widget buildNavBar(BuildContext context) {
    return buildAnimatedTitleNavBar(
      title: artboardTitle,
      actionButtons: artboardActionButtons(context),
      navButton: artboardNavButton(context),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        buildPageHeader(artboardTitle),
        artboardBody(context),
      ],
    );
  }
}
