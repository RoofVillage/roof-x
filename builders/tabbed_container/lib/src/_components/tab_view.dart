import 'package:flutter/material.dart';

class RoofTabView extends StatelessWidget {
  final List<Widget> views;
  final TabController tabController;

  const RoofTabView({
    @required this.views,
    @required this.tabController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: views,
      controller: tabController,
    );
  }
}
