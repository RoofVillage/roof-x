import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'activity_item.dart';

class RoofActivityEvent extends StatelessWidget with ActivityItem {
  final String timestamp;
  final String title;
  final String note;
  final List values;

  RoofActivityEvent({this.timestamp, this.title, this.note, this.values});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleTextStyle =
        titleStyle.textStyleWithColor(theme.color.text.secondary);
    final timestampTextStyle =
        timestampStyle.textStyleWithColor(theme.color.text.secondary);
    final noteTextStyle =
        noteStyle.textStyleWithColor(theme.color.text.primary);

    final mainContainerChildren = <Widget>[];

    final titleText = Container(
        padding: textRightPadding, child: Text(title, style: titleTextStyle));
    final timestampText = Text(timestamp, style: timestampTextStyle);

    final topRow = Row(children: <Widget>[titleText, timestampText]);
    mainContainerChildren.add(topRow);

    if (note != null) {
      final noteRow = Text(note, style: noteTextStyle);
      mainContainerChildren.add(spacerRow);
      mainContainerChildren.add(noteRow);
    }
    // final values = GridView();

    final eventIcon = IconReference.event;
    final iconWidget = Container(
        padding: EdgeInsets.only(right: RoofDistance.b),
        child: eventIcon.buildSvg(color: theme.color.icon.general));

    final mainContainer = _EventMainContainer(children: mainContainerChildren);

    return Container(
      // margin: RoofObjectPadding.activityPadding,
      margin: RoofObjectPadding.section1,
      child: Row(
        children: <Widget>[iconWidget, mainContainer],
      ),
    );
  }
}

class _EventMainContainer extends StatelessWidget {
  final List<Widget> children;

  _EventMainContainer({this.children});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final boxDecoration = BoxDecoration(
        color: theme.color.background.general,
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    return Container(
        padding: EdgeInsets.all(RoofDistance.c),
        decoration: boxDecoration,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children));
  }
}
