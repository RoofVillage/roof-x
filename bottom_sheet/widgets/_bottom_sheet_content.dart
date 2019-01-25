import 'package:flutter/material.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/fields/switch_field.dart';

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
            padding: RoofObjectPadding.containerPaddingA(),
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
