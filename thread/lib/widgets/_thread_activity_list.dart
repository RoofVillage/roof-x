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

    final topGradient = _ActivityListGradient(gradientType: GradientType.top);

    final bottomGradient =
        _ActivityListGradient(gradientType: GradientType.bottom);

    return Expanded(
        child: Stack(children: [
      Container(color: backgroundColor, padding: padding, child: activityList),
      topGradient,
      bottomGradient
    ]));
  }
}

class _ActivityListGradient extends StatelessWidget {
  final GradientType gradientType;

  _ActivityListGradient({this.gradientType});

  final double _gradientHeight = RoofDistance.c;

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment columnAlignment;
    Alignment gradientStart;
    Alignment gradientEnd;

    if (gradientType == GradientType.top) {
      columnAlignment = MainAxisAlignment.end;
      gradientStart = Alignment.bottomCenter;
      gradientEnd = Alignment.topCenter;
    } else if (gradientType == GradientType.bottom) {
      columnAlignment = MainAxisAlignment.start;
      gradientStart = Alignment.topCenter;
      gradientEnd = Alignment.bottomCenter;
    }

    final gradientColor = RoofTheme.of(context).color.background.brandSecondary;

    return Column(mainAxisAlignment: columnAlignment, children: [
      Container(
          height: _gradientHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: gradientStart,
                  end: gradientEnd,
                  colors: [gradientColor, gradientColor.withAlpha(0)])))
    ]);
  }
}

enum GradientType { top, bottom }
