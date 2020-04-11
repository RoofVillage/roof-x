import 'package:flutter/material.dart';
import 'package:header_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:nav_bar_builder/index.dart';

abstract class ScrollViewVerticalFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        PageHeaderBuilder,
        Artboard,
        AnimatedTitleNavBarBuilder {
  final _scrollController = ScrollController();

  String get artboardTitle;

  @override
  bool get hideNavBarOnScroll => true;

  @override
  ScrollController get bodyScrollController => _scrollController;

  double horizontalGutter(BuildContext context) =>
      SemanticTheme.of(context).distance.gutter.horizontal.medium;

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  List<Widget> children(BuildContext context);

  @override
  Widget buildNavBar(BuildContext context) => buildAnimatedTitleNavBar(
        title: artboardTitle,
        scrollController: _scrollController,
        actionButtons: artboardActionButtons(context),
        navButton: artboardNavButton(context),
        hideOnScroll: true,
      );

  @override
  List<Widget> buildBodySlivers(BuildContext context) {
    if (artboardTitle != null) {
      final pageHeader = SliverToBoxAdapter(
        child: buildPageHeader(
          text: artboardTitle,
          horizontalGutter: horizontalGutter(context),
        ),
      );

      return [
        pageHeader,
        ...children(context),
      ];
    } else {
      final spacer = SliverToBoxAdapter(
        child: Container(
          height: SemanticTheme.of(context).distance.gutter.vertical.medium,
        ),
      );

      return [
        spacer,
        ...children(context),
      ];
    }
  }
}
