import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:tab/index.dart';

class StandardTabBar extends StatelessWidget {
  final List<RoofTab> tabs;
  final TabController tabController;

  StandardTabBar({
    @required this.tabs,
    @required this.tabController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> tabWidgets = [];

    for (RoofTab tab in tabs) {
      tabWidgets.add(
        _buildTabWidget(tab, theme),
      );
    }

    final labelColor = theme.color.text.generalSecondary;
    final activeLabelColor = theme.color.text.generalPrimary;

    return Container(
      alignment: Alignment(-1, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.color.stroke.medium)),
      ),
      child: TabBar(
        tabs: tabWidgets,
        controller: tabController,
        isScrollable: true,
        labelStyle: theme.typography.detailHeavy.textStyle(
          color: activeLabelColor,
        ),
        // Fix for bug where TabBar with only one tab is styled as inactive
        unselectedLabelColor: tabs.length > 1 ? labelColor : null,
        labelColor: activeLabelColor,
        indicatorColor: activeLabelColor,
        labelPadding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.min,
          horizontal: theme.distance.padding.horizontal.medium,
        ),
      ),
    );
  }

  Widget _buildTabWidget(RoofTab tab, SemanticThemeData theme) {
    final List<Widget> children = [];

    if (tab.icon != null) {
      final Icon iconWidget = tab.icon.buildWidget();
      children.add(iconWidget);
    }

    if (tab.title != null) {
      final Widget titleWidget = Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.min,
        ),
        child: Text(tab.title),
      );
      children.add(titleWidget);
    }

    return Container(
      child: Column(
        children: children,
      ),
    );
  }
}
