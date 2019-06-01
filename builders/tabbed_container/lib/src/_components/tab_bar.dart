import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:tab/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class RoofTabBar extends StatelessWidget {
  final List<RoofTab> tabs;
  final TabController tabController;

  RoofTabBar({
    @required this.tabs,
    @required this.tabController,
    Key key,
  }) : super(key: key);

  final _labelTypography = typography.detailPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<String> tabTitles = tabs.map((tab) => tab.title).toList();

    final List<Widget> tabWidgets = [];

    for (var tab in tabTitles) {
      final Widget tabWidget = Text(tab.toUpperCase());

      tabWidgets.add(tabWidget);
    }

    final labelColor = theme.color.text.secondary;
    final activeLabelColor = theme.color.text.brand;

    // Labelstyle color is ignored by TabBar widget
    final labelStyle = _labelTypography.textStyleWithColor(activeLabelColor);

    return Container(
      alignment: Alignment(-1, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.color.stroke.light)),
      ),
      child: TabBar(
        tabs: tabWidgets,
        controller: tabController,
        isScrollable: true,
        labelStyle: labelStyle,
        // Fix for bug where TabBar with only one tab is styled as inactive
        unselectedLabelColor: tabs.length > 1 ? labelColor : null,
        labelColor: activeLabelColor,
        indicatorColor: activeLabelColor,
        labelPadding: EdgeInsets.symmetric(
          vertical: distance.a,
          horizontal: distance.c,
        ),
      ),
    );
  }
}
