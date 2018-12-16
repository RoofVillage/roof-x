import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/icon/index.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

import 'title_label.dart';
import 'detail_label.dart';

class Body extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final StandardizedIconReference iconReference;

  final _verticalPadding = RoofUIDistance.b;
  final _imagePaddingRight = RoofUIDistance.b;

  Body(
      {Key key,
      @required this.titleText,
      @required this.iconReference,
      @required this.detailText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: _verticalPadding),
        //The body of the cell contains the icon and the labels.
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(right: _imagePaddingRight),
                  child: RoofUIStandardizedIcon(iconReference: iconReference)),

              ///This child should expand to occupy remaining space.
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _relevantLabels(),
              ))
            ]));
  }

  List<Widget> _relevantLabels() {
    List<Widget> list = [TitleLabel(decoratedText: titleText)];
    if (detailText != null && detailText.trim().isNotEmpty) {
      list.add(DetailLabel(text: detailText));
    }
    return list;
  }
}
