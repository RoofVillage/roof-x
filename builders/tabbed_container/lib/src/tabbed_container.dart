import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;

import 'tab.dart';
import '_components/tab_bar.dart';
import '_components/tab_view.dart';

class RoofTabbedContainer extends StatefulWidget {
  final List<RoofTab> tabs;

  RoofTabbedContainer({@required this.tabs, Key key}) : super(key: key);

  _RoofTabbedContainerState createState() => _RoofTabbedContainerState();
}

class _RoofTabbedContainerState extends State<RoofTabbedContainer>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );
  }

  final _verticalMargin = distance.d;

  @override
  Widget build(BuildContext context) {
    final List<String> tabTitles = widget.tabs.map((tab) => tab.title).toList();

    final tabBar = RoofTabBar(
      tabs: tabTitles,
      tabController: tabController,
    );

    final List<Widget> tabViews = widget.tabs.map((tab) => tab.view).toList();

    final tabView = RoofTabView(
      views: tabViews,
      tabController: tabController,
    );

    return Container(
      margin: EdgeInsets.only(top: _verticalMargin),
      child: Column(
        children: [
          tabBar,
          tabView,
        ],
      ),
    );
  }
}
