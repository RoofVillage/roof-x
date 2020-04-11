import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:tab/index.dart';

import '_components/tab_bar.dart';
import '_components/tab_view.dart';

class TabbedContainer extends StatefulWidget {
  final List<RoofTab> tabs;

  TabbedContainer({
    @required this.tabs,
  });

  _TabbedContainerState createState() => _TabbedContainerState();
}

class _TabbedContainerState extends State<TabbedContainer>
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

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final tabBar = Container(
      child: StandardTabBar(
        tabs: widget.tabs,
        tabController: _tabController,
      ),
    );
    final tabView = Expanded(
      child: StandardTabView(
        tabs: widget.tabs,
        controller: _tabController,
      ),
    );
    List<Widget> columnChildren = [tabBar, tabView];

    final Widget bodyColumn = Column(children: columnChildren);

    return Container(
      color: theme.color.background.general,
      padding: EdgeInsets.only(
        top: theme.distance.padding.vertical.medium,
      ),
      child: bodyColumn,
    );
  }
}
