import 'package:flutter/material.dart';
import 'package:header_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:view_stream_builder_builder/index.dart';

abstract class StreamListViewVerticalFullScreenArtboard<T>
    extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        PageHeaderBuilder,
        Artboard,
        AnimatedTitleNavBarBuilder,
        ViewStreamBuilderBuilder,
        SpacedListViewBuilder {
  final _scrollController = ScrollController();

  String get artboardTitle;

  Widget artboardNavButton(BuildContext context);

  List<Widget> artboardActionButtons(BuildContext context);

  Stream<T> get stream;

  Widget loadingStateWidget(BuildContext context);

  Widget emptyStateWidget(BuildContext context);

  List<Widget> listViewChildren(BuildContext context, T streamSnapshot);

  @override
  Widget buildNavBar(BuildContext context) => buildAnimatedTitleNavBar(
        title: artboardTitle,
        actionButtons: artboardActionButtons(context),
        navButton: artboardNavButton(context),
      );

  @override
  Widget buildBody(BuildContext context) => buildViewStreamBuilder(
        context,
        stream: stream,
        loading: loadingStateWidget(context),
        empty: emptyStateWidget(context),
        child: (BuildContext context, T streamSnapshot) => buildSpacedListView(
          children: [
            buildPageHeader(
              text: artboardTitle,
              horizontalGutter: 0,
            ),
            ...listViewChildren(
              context,
              streamSnapshot,
            ),
          ],
          scrollController: _scrollController,
        ),
      );
}
