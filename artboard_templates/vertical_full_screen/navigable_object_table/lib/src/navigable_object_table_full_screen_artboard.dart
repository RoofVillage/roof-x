import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:spaced_column_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';

abstract class NavigableObjectFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledNavBarBuilder,
        SpacedColumnBuilder,
        RoofBreadcrumbBuilder,
        KeyValueRowBuilder,
        RoofTabbedContainerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledNavBar(context);

  List<RoofBreadcrumb> get breadcrumbs;
  List<KeyValueRow> get infoRows;
  List<RoofTab> get tabs;

  @override
  Widget buildBody(BuildContext context) {
    final breadcrumbStack = buildBreadcrumbStack(
      context,
      breadcrumbs: breadcrumbs,
    );

    final infoSection = buildSpacedColumn(
      context,
      children: infoRows,
    );

    final tabbedContainer = buildTabbedContainer(
      context,
      tabs,
    );

    return Container(
      child: Column(
        children: <Widget>[
          breadcrumbStack,
          infoSection,
          tabbedContainer,
        ],
      ),
    );
  }
}
