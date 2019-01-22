import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:icon_library/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/color.dart';

import 'widgets/index.dart';

class RoofCellA extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final SmallIconReference iconReference;
  final VoidCallback onTap;

  final _horizontalPadding = RoofDistance.b;
  final _minHeight = RoofDistance.f;
  final _backgroundColor = RoofColor.neutralColorA;

  RoofCellA(
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
                decoration: BoxDecoration(color: _backgroundColor),
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
