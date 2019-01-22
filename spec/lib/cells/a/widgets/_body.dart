import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:icon_library/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/color.dart';

import '_title_label.dart';
import '_detail_label.dart';

class Body extends StatelessWidget {
  final WeightDecoratedText titleText;
  final String detailText;
  final SmallIconReference iconReference;

  final _verticalPadding = RoofDistance.b;
  final _imagePaddingRight = RoofDistance.b;
  final _detailPaddingTop = RoofDistance.a;
  final _iconColor = RoofColor.neutralColorG;

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
                  child: iconReference.buildSvg(color: _iconColor)),

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
      list.add(Container(
          padding: EdgeInsets.only(top: _detailPaddingTop),
          child: DetailLabel(text: detailText)));
    }
    return list;
  }
}
