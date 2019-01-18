import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

import './widgets/_body.dart';
import './widgets/_divider.dart';

class RoofUICellA extends StatelessWidget {
  final RoofUIWeightDecoratedText titleText;
  final String detailText;
  final RoofUISmallIconReference iconReference;
  final VoidCallback onTap;

  final _horizontalPadding = RoofUIDistance.b;
  final _minHeight = RoofUIDistance.f;

  RoofUICellA(
      {Key key,
      @required this.titleText,
      @required this.iconReference,
      @required this.detailText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Allows a minHeight.
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: _minHeight),
        child: GestureDetector(
            onTap: this.onTap,
            child: Container(
                // Everything in the cell is relative to the horizontal padding.
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: _horizontalPadding),

                    ///This column contains the body of the cell, and the divider;
                    child: Column(

                        ///Maximizes space between body and divider
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Body(
                              iconReference: iconReference,
                              titleText: titleText,
                              detailText: detailText),
                          CellDivider()
                        ])))));
  }
}
