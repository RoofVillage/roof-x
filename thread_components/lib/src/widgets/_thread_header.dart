import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class ThreadHeader extends StatelessWidget {
  final String title;
  final List<Widget> threadMenuItems;

  ThreadHeader({this.title, this.threadMenuItems});

  final _headerTextStyle = RoofTypography.heading1;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    _openThreadMenu(threadMenuItems) {
      // open bottom sheet with thread menu items (e.g. unsubscribe)
    }

    final backgroundColor = theme.color.background.brandPrimary;

    final padding = RoofObjectPadding.container1;

    final threadTitleTextStyle =
        _headerTextStyle.textStyleWithColor(theme.color.text.brand);

    final backButton = Padding(
        padding: EdgeInsets.fromLTRB(0, 0, RoofDistance.b, 0),
        child: IconReference.cashSack.buildSvg(color: theme.color.icon.nav));

    final threadTitleWidget =
        Expanded(child: Text(title, style: threadTitleTextStyle));

    final threadMenu = GestureDetector(
      onTap: _openThreadMenu(threadMenuItems),
      child: IconReference.cashSack.buildSvg(color: theme.color.icon.general),
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
