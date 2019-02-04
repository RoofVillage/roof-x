import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class ThreadHeader extends StatelessWidget {
  final String title;
  final List<Widget> threadMenuItems;
  final Color backgroundColor;

  ThreadHeader({this.title, this.threadMenuItems, this.backgroundColor});

  final _headerTextStyle = RoofTypography.heading1;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    _openThreadMenu(threadMenuItems) {
      print("edit menu");
      // open bottom sheet with thread menu items (e.g. unsubscribe)
    }

    final padding = RoofObjectPadding.container1;

    final threadTitleTextStyle =
        _headerTextStyle.textStyleWithColor(theme.color.text.brand);

    final backButton = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
        child: IconReference.backArrow.buildSvg(color: theme.color.icon.nav));

    final threadTitleWidget =
        Expanded(child: Text(title, style: threadTitleTextStyle));

    final threadMenu = GestureDetector(
      onTap: _openThreadMenu(threadMenuItems),
      child: IconReference.edit.buildSvg(color: theme.color.icon.general),
    );

    final headerContents = Row(
      children: <Widget>[backButton, threadTitleWidget, threadMenu],
    );

    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Container(
            color: backgroundColor, padding: padding, child: headerContents));
  }
}
