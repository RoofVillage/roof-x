import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/icon/index.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

import 'widgets/title_label.dart';
import 'widgets/detail_label.dart';
import 'widgets/divider.dart';

class RoofUICellA extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final StandardizedIconReference iconReference;
  final VoidCallback onPressed;

  RoofUICellA(
      {Key key,
      @required this.titleText,
      @required this.iconReference,
      @required this.detailText,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        // Stretch the cards in horizontal axis
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              // Everything in the cell is relative to the horizontal padding.
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: RoofUIDistance.b),

                  ///This column contains the body of the cell, and the divider;
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: RoofUIDistance.b),
                            //The body of the cell contains the icon and the labels.
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RoofUIStandardizedIcon(
                                      iconReference: iconReference),

                                  ///This child should expand to occupy remaining space.
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _relevantLabels(),
                                  ))
                                ])),
                        CellDivider(),
                      ])))
        ],
      )),
    );
  }

  List<Widget> _relevantLabels() {
    List<Widget> list = [TitleLabel(decoratedText: titleText)];
    if (detailText != null && detailText.trim().isNotEmpty) {
      list.add(DetailLabel(text: detailText));
    }
    return list;
  }
}
