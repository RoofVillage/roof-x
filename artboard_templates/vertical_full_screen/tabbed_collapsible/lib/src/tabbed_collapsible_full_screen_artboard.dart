import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:distance/index.dart' as distance;

abstract class TabbedCollapsibleFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledIconNavBarBuilder,
        RoofBreadcrumbBuilder,
        KeyValueRowBuilder,
        RoofTabbedContainerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledIconNavBar(context);

  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context);
  List<Widget> buildInfoRows(BuildContext context);
  List<RoofTab> buildTabs(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    List<Widget> sliverChildren = [];

    final breadcrumbs = buildBreadcrumbs(context);
    if (breadcrumbs != null && breadcrumbs.isNotEmpty) {
      final breadcrumbStack = Container(
        margin: EdgeInsets.only(bottom: distance.b),
        child: buildBreadcrumbStack(
          context,
          breadcrumbs: buildBreadcrumbs(context),
        ),
      );

      sliverChildren.add(breadcrumbStack);
    }

    final infoRows = buildInfoRows(context);
    if (infoRows != null && infoRows.isNotEmpty) {
      final infoSection = Container(
        padding: EdgeInsets.symmetric(horizontal: distance.b),
        margin: EdgeInsets.only(
          top: distance.b,
          bottom: distance.d,
        ),
        child: Column(
          children: buildInfoRows(context),
        ),
      );

      sliverChildren.add(infoSection);
    }

    final tabbedContainer = buildTabbedContainer(
      context,
      buildTabs(context),
    );

    return NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate(sliverChildren),
          ),
        ];
      },
      body: tabbedContainer,
    );
  }
}
