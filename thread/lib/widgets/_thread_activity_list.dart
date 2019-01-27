import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class ThreadActivityList extends StatelessWidget {
  final List<Widget> threadActivityItems;

  ThreadActivityList({this.threadActivityItems});

  @override
  Widget build(BuildContext context) {
    final _backgroundColor = RoofColor.neutralColorA;

    final _padding = RoofObjectPadding.containerPaddingA();

    final _emptyTextStyle = TextStyle(
        color: RoofColor.neutralColorE,
        fontSize: RoofFontSize.small,
        fontWeight: RoofFontWeight.thin);

    final emptyThreadMessage = Text(
      "No activity",
      style: _emptyTextStyle,
      textAlign: TextAlign.center,
    );

    List<Widget> _listChildren = [];
    if (threadActivityItems == null || threadActivityItems.length == 0)
      _listChildren.add(emptyThreadMessage);
    else
      _listChildren = threadActivityItems;

    final _activityList = ListView(reverse: true, children: _listChildren);

    return Expanded(
        child: Container(
            color: _backgroundColor, padding: _padding, child: _activityList));
  }
}
