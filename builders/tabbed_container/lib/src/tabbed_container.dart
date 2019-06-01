import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:visibility_manager_builder/index.dart';
import 'package:collapsible_container_builder/index.dart';
import 'package:input_dock_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:distance/index.dart' as distance;

import 'tab.dart';
import '_components/tab_bar.dart';
import '_components/tab_view.dart';

class RoofTabbedContainer extends StatefulWidget {
  final List<RoofTab> tabs;

  RoofTabbedContainer({
    @required this.tabs,
    Key key,
  }) : super(key: key);

  _RoofTabbedContainerState createState() => _RoofTabbedContainerState();
}

class _RoofTabbedContainerState extends State<RoofTabbedContainer>
    with
        SingleTickerProviderStateMixin,
        InputDockBuilder,
        CollapsibleContainerBuilder {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final _verticalMargin = distance.c;

  @override
  List<Widget> get auxiliaryWidgets => [AddFileAuxiliaryWidget()];

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final tabBar = Container(
      child: RoofTabBar(
        tabs: widget.tabs,
        tabController: _tabController,
      ),
    );
    final tabView = Expanded(
      child: RoofTabView(
        tabs: widget.tabs,
        controller: _tabController,
      ),
    );
    List<Widget> columnChildren = [tabBar, tabView];

    Widget bodyColumn = Column(children: columnChildren);

    final bool bodyHasDock = widget.tabs.where((tab) => tab.hasDock).isNotEmpty;

    if (bodyHasDock) {
      final inputDock = buildInputDock(context);

      final collapsibleDock = buildCollapsibleContainer(
        context,
        child: inputDock,
      );

      columnChildren.add(collapsibleDock);

      bodyColumn = InheritedVisibilityManager(
        child: Column(children: columnChildren),
      );
    }

    return Container(
      color: theme.color.background.generalPrimary,
      padding: EdgeInsets.only(top: _verticalMargin),
      child: bodyColumn,
    );
  }
}
