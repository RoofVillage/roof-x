import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

class ThreadActivityList extends StatelessWidget {
  final List<Widget> threadActivityItems;
  final Color backgroundColor;

  ThreadActivityList({this.threadActivityItems, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    // final padding = RoofObjectPadding.horizontal1;
    final padding = RoofObjectPadding.container1;

    List<Widget> listChildren = [];
    if (threadActivityItems != null || threadActivityItems.length > 0)
      listChildren = threadActivityItems;
    else
      listChildren.add(_EmptyListMessage());

    final activityList = ListView(reverse: true, children: listChildren);

    return Expanded(
        child: Stack(children: [
      Container(color: backgroundColor, padding: padding, child: activityList),
      _ActivityListGradient()
    ]));
  }
}

class _EmptyListMessage extends StatelessWidget {
  final _textStyle = RoofTypography.body1a;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final emptyTextStyle =
        _textStyle.textStyleWithColor(theme.color.text.secondary);

    final emptyText = "No activity";

    return Container(
        child: Text(emptyText,
            style: emptyTextStyle, textAlign: TextAlign.center));
  }
}

class _ActivityListGradient extends StatelessWidget {
  final double _gradientHeight = RoofDistance.c;

  @override
  Widget build(BuildContext context) {
    final topGradientColor = RoofTheme.of(context).color.background.general;
    final bottomGradientColor = RoofTheme.of(context).color.background.general;

    final topGradient = Container(
        height: _gradientHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [topGradientColor, topGradientColor.withAlpha(0)])));

    final bottomGradient = Container(
        height: _gradientHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              bottomGradientColor,
              bottomGradientColor.withAlpha(0)
            ])));

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topGradient, 
        // bottomGradient
        ]);
  }
}
