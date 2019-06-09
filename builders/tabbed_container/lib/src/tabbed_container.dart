import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:tab/index.dart';
import 'package:distance/index.dart' as distance;

import '_components/tab_bar.dart';
import '_components/tab_view.dart';

class RoofTabbedContainer extends StatefulWidget {
  final List<RoofTab> tabs;

  RoofTabbedContainer({
    @required this.tabs,
  });

  _RoofTabbedContainerState createState() => _RoofTabbedContainerState();
}

class _RoofTabbedContainerState extends State<RoofTabbedContainer>
    with SingleTickerProviderStateMixin {
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

    return Container(
      color: theme.color.background.inputForeground,
      padding: EdgeInsets.only(top: _verticalMargin),
      child: bodyColumn,
    );
  }
}
