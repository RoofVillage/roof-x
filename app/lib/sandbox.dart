import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:thread/index.dart';

class Sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    threadAction() {
      print("action pressed");
    }

    ///change to button sheet scaffold.
    return Scaffold(
        body: RoofThread(
      threadTitle: "Thread bb",
      threadActionTitle: "Pay",
      threadAction: threadAction,
      threadActionIconReference: IconReference.balances,
    ));
  }
}
