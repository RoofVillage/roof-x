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

abstract class NavigableObjectFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledNavBarBuilder,
        RoofBreadcrumbBuilder,
        KeyValueRowBuilder,
        RoofTabbedContainerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledNavBar(context);

  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context);
  List<KeyValueRow> buildInfoRows(BuildContext context);
  List<RoofTab> buildTabs(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    final breadcrumbStack = Container(
      margin: EdgeInsets.only(bottom: distance.c),
      child: buildBreadcrumbStack(
        context,
        breadcrumbs: buildBreadcrumbs(context),
      ),
    );

    final infoSection = Container(
      padding: EdgeInsets.symmetric(horizontal: distance.b),
      margin: EdgeInsets.only(bottom: distance.d),
      child: Column(
        children: buildInfoRows(context),
      ),
    );

    final tabbedContainer = buildTabbedContainer(
      context,
      buildTabs(context),
    );

    return NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverList(
            delegate: SliverChildListDelegate([breadcrumbStack, infoSection]),
          ),
        ];
      },
      body: tabbedContainer,
    );
  }
}
