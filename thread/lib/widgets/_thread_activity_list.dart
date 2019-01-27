import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:spec/typography/index.dart';

class ThreadActivityList extends StatelessWidget {
  final List<Widget> threadActivityItems;

  ThreadActivityList({this.threadActivityItems});

  final _textStyle = RoofTypography.body1b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final backgroundColor = theme.color.background.general;

    final padding = RoofObjectPadding.container1;

    final emptyTextStyle =
        _textStyle.textStyleWithColor(theme.color.text.secondary);

    final emptyThreadMessage = Text(
      "No activity",
      style: emptyTextStyle,
      textAlign: TextAlign.center,
    );

    List<Widget> listChildren = [];
    if (threadActivityItems == null || threadActivityItems.length == 0)
      listChildren.add(emptyThreadMessage);
    else
      listChildren = threadActivityItems;

    final activityList = ListView(reverse: true, children: listChildren);

    return Expanded(
        child: Container(
            color: backgroundColor, padding: padding, child: activityList));
  }
}
