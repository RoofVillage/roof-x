import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import '../activity.dart';

class RoofActivityComment extends StatelessWidget with ActivityItem {
  final String creator;
  final String timestamp;
  final String note;
  final List<String> files;

  RoofActivityComment({this.creator, this.timestamp, this.note, this.files});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final creatorTextStyle =
        titleStyle.textStyleWithColor(theme.color.text.primary);
    final timestampTextStyle =
        timestampStyle.textStyleWithColor(theme.color.text.secondary);
    final noteTextStyle =
        noteStyle.textStyleWithColor(theme.color.text.primary);

    final creatorText = Container(
        padding: textRightPadding,
        child: Text(creator, style: creatorTextStyle));
    final timestampText = Text(timestamp, style: timestampTextStyle);

    final topRow = Row(children: <Widget>[creatorText, timestampText]);
    final noteRow = Row(children: <Widget>[Text(note, style: noteTextStyle)]);

    return Container(
      // margin: RoofObjectPadding.activityPadding,
      margin: RoofObjectPadding.section1,
      child: Column(children: <Widget>[topRow, spacerRow, noteRow]),
    );
  }
}
