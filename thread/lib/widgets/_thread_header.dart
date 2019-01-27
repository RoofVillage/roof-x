import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';

class ThreadHeader extends StatelessWidget {
  final String title;
  final List<Widget> threadMenuItems;

  ThreadHeader({this.title, this.threadMenuItems});

  @override
  Widget build(BuildContext context) {
    _openThreadMenu(threadMenuItems) {
      // open bottom sheet with thread menu items (e.g. unsubscribe)
    }

    final _backgroundColor = RoofColor.neutralColorA;

    final _padding = RoofObjectPadding.containerPaddingA();

    final _threadTitleTextStyle = TextStyle(
        color: RoofColor.red,
        fontWeight: RoofFontWeight.thick,
        fontSize: RoofFontSize.extraLarge);

    final _threadTitleWidget = Text(title, style: _threadTitleTextStyle);

    final _threadMenu = GestureDetector(
      onTap: _openThreadMenu(threadMenuItems),
      child: IconReference.cashSack.buildSvg(color: RoofColor.neutralColorF),
    );

    final _headerContents = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[_threadTitleWidget, _threadMenu],
    );

    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Container(
            color: _backgroundColor,
            padding: _padding,
            child: _headerContents));
  }
}
