import 'package:flutter/material.dart';
import 'package:roof/roofui_kit/roofui_distance.dart';

import 'widgets/title_label.dart';
import 'widgets/detail_label.dart';
import 'widgets/divider.dart';
import 'widgets/icon.dart';

class RoofUICellA extends StatelessWidget {
  final String titleText;
  final String detailText;
  final String iconPath;
  final VoidCallback onPressed;

  RoofUICellA(
      {Key key,
      @required this.titleText,
      @required this.iconPath,
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
                                  CellIcon(path: iconPath),

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
    List<Widget> list = [TitleLabel(text: titleText)];
    if (detailText != null && detailText.trim().isNotEmpty) {
      list.add(DetailLabel(text: detailText));
    }
    return list;
  }
}
