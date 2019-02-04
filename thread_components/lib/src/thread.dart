import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'view/index.dart';

class RoofThread extends StatelessWidget {
  final String threadTitle;
  final List<Widget> threadActivityItems;
  final List<Widget> threadMenuItems;
  final String threadActionTitle;
  final StandardIconReference threadActionIconReference;
  final Function threadAction;

  RoofThread(
      {this.threadTitle,
      this.threadActivityItems,
      this.threadMenuItems,
      this.threadActionTitle,
      this.threadActionIconReference,
      this.threadAction});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final Color _threadHeaderColor = theme.color.background.general;
    final Color _threadListColor = theme.color.background.general;
    final Color _threadBottomColor = theme.color.background.general;

    return Container(
        child: Column(children: [
      ThreadHeader(
          title: threadTitle,
          threadMenuItems: threadMenuItems,
          backgroundColor: _threadHeaderColor),
      ThreadActivityList(
          threadActivityItems: threadActivityItems,
          backgroundColor: _threadListColor),
      ThreadBottomBar(
          threadActionTitle: threadActionTitle,
          threadAction: threadAction,
          threadActionIconReference: threadActionIconReference,
          backgroundColor: _threadBottomColor)
    ]));
  }
}
