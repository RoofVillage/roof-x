import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:collapsible_container_builder/index.dart';
import 'package:visibility_manager_builder/index.dart';

abstract class TabbedFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        InputDockBuilder,
        TitledIconNavBarBuilder,
        RoofBreadcrumbBuilder,
        InputDockBuilder,
        RoofTabbedContainerBuilder,
        CollapsibleContainerBuilder,
        VisibilityManagerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledIconNavBar(context);

  Widget buildCollapsibleTabDock(BuildContext context) => null;

  List<RoofTab> buildTabs(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    final tabs = buildTabs(context);

    final bool bodyHasDock = tabs.where((tab) => tab.hasDock).isNotEmpty;

    final tabbedContainer = Expanded(
      child: buildTabbedContainer(
        context,
        tabs,
      ),
    );

    if (bodyHasDock) {
      final dock = buildCollapsibleContainer(
        context,
        child: buildCollapsibleTabDock(context),
      );

      final bodyColumn = Column(
        children: <Widget>[
          tabbedContainer,
          dock,
        ],
      );

      return buildVisibilityManager(context, child: bodyColumn);
    }

    return tabbedContainer;
  }
}
