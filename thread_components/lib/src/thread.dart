import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'widgets/index.dart';

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
    return Container(
        child: Column(children: [
      ThreadHeader(title: threadTitle, threadMenuItems: threadMenuItems),
      ThreadActivityList(threadActivityItems: threadActivityItems),
      ThreadBottomBar(
          threadActionTitle: threadActionTitle,
          threadAction: threadAction,
          threadActionIconReference: threadActionIconReference)
    ]));
  }
}
