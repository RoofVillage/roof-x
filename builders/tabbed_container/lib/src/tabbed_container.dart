import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:visibility_manager_builder/index.dart';
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
    with SingleTickerProviderStateMixin {
  final GlobalKey _tabContainerKey = GlobalKey();
  TabController _tabController;
  VisibilityManager _dockVisibilityManager;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );

    _tabController.addListener(_dockVisibleForTab);

    WidgetsBinding.instance.addPostFrameCallback(
      (Duration d) => _dockVisibleForTab(),
    );
  }

  @override
  void didChangeDependencies() {
    _dockVisibilityManager = InheritedVisibilityManager.of(context);

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _dockVisibleForTab() {
    if (_dockVisibilityManager == null) return;

    final offset = _tabController.offset;
    final bool dragging = offset != 0;

    int index = _tabController.index;

    if (dragging && offset.abs() > .5) {
      if (offset > 0) {
        index += 1;
      } else if (offset < 0) {
        index -= 1;
      }
    }

    final tab = widget.tabs[index];
    final visible = tab.hasDock ?? false;

    _dockVisibilityManager?.setVisibility(visible);
  }

  final _verticalMargin = distance.c;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<String> tabTitles = widget.tabs.map((tab) => tab.title).toList();
    final tabBar = Container(
      child: RoofTabBar(
        tabs: tabTitles,
        tabController: _tabController,
      ),
    );

    final List<Widget> tabViews = widget.tabs.map((tab) => tab.view).toList();
    final tabView = Flexible(
      child: RoofTabView(
        views: tabViews,
        tabController: _tabController,
        onDragCallback: _dockVisibleForTab,
      ),
    );

    return Container(
      color: theme.color.background.generalPrimary,
      key: _tabContainerKey,
      padding: EdgeInsets.only(top: _verticalMargin),
      child: Column(
        children: [
          tabBar,
          tabView,
        ],
      ),
    );
  }
}
