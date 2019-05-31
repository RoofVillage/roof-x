import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

import 'tab.dart';
import '_components/tab_bar.dart';
import '_components/tab_view.dart';

class RoofTabbedContainer extends StatefulWidget {
  final List<RoofTab> tabs;
  final Function(bool) dockVisibilityListener;

  RoofTabbedContainer({
    @required this.tabs,
    this.dockVisibilityListener,
    Key key,
  }) : super(key: key);

  _RoofTabbedContainerState createState() => _RoofTabbedContainerState();
}

class _RoofTabbedContainerState extends State<RoofTabbedContainer>
    with SingleTickerProviderStateMixin {
  final GlobalKey _tabContainerKey = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
    );

    if (widget.dockVisibilityListener != null) {
      _tabController.addListener(_dockVisibleForTab);

      WidgetsBinding.instance.addPostFrameCallback(
        (Duration d) => _dockVisibleForTab(),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _dockVisibleForTab() {
    print("offset ${_tabController.offset}");

    final offset = _tabController.offset;
    final bool dragging = offset != 0;

    int index = _tabController.index;

    // Get tab that is being dragged to
    if (dragging && offset.abs() > .5) {
      if (offset > 0) {
        index += 1;
      } else if (offset < 0) {
        index -= 1;
      }
    }

    final tab = widget.tabs[index];
    final visible = tab.hasDock ?? false;

    widget.dockVisibilityListener(visible);
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
