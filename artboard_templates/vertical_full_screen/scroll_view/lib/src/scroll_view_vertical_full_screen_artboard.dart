import 'package:flutter/material.dart';
import 'package:page_header_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:nav_bar_builder/index.dart';

abstract class ScrollViewVerticalFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        PageHeaderBuilder,
        Artboard,
        AnimatedTitleNavBarBuilder {
  final _scrollController = ScrollController();

  @override
  ScrollController get artboardBodyScrollController => _scrollController;

  String get artboardTitle;

  double horizontalGutter(BuildContext context) => 0;

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  List<Widget> children(BuildContext context);

  @override
  Widget buildNavBar(BuildContext context) => buildAnimatedTitleNavBar(
        title: artboardTitle,
        actionButtons: artboardActionButtons(context),
        navButton: artboardNavButton(context),
      );

  @override
  Widget buildBody(BuildContext context) => CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              child: buildPageHeader(artboardTitle),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalGutter(context),
              ),
            ),
          ),
          ...children(context),
        ],
      );
}
