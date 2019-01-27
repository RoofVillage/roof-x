import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class RoofBottomSheetContent extends StatelessWidget {
  final void scrollListener;

  RoofBottomSheetContent({this.scrollListener});

  @override
  Widget build(BuildContext context) {
    return Listener(
        // onPointerMove: (details) => scrollListener,
        // behavior: HitTestBehavior.opaque,
        child: ListView(
            shrinkWrap: true,
            padding: RoofObjectPadding.container1,
            children: <Widget>[
          RoofSwitchField(
            title: "Here's a switch field",
          ),
          // RoofTextField(
          //   fieldName: "Some text",
          //   placeholder: "Placeholder",
          // )
        ]));
  }
}
