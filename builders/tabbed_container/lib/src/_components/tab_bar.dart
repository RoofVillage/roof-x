import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class RoofTabBar extends StatelessWidget {
  final List<String> tabs;
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

    final List<Widget> tabWidgets = [];

    for (var tab in tabs) {
      final Widget tabWidget = Text(tab.toUpperCase());

      tabWidgets.add(tabWidget);
    }

    final labelColor = theme.color.text.secondary;
    final activeLabelColor = theme.color.text.brand;
    final unselectedLabelStyle =
        _labelTypography.textStyleWithColor(labelColor);
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
        unselectedLabelStyle: unselectedLabelStyle,
        labelStyle: labelStyle,
        unselectedLabelColor: labelColor,
        labelColor: activeLabelColor,
        indicatorColor: activeLabelColor,
        labelPadding: EdgeInsets.symmetric(
          vertical: distance.a,
          horizontal: distance.d,
        ),
      ),
    );
  }
}
