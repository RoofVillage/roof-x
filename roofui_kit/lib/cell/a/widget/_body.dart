import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/icon/roofui_standardized_icon.dart';
import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_asset_reference.dart';

import './_title_label.dart';
import './_detail_label.dart';

class Body extends StatelessWidget {
  final RoofUIWeightDecoratedText titleText;
  final String detailText;
  final RoofUISmallAssetReference assetReference;

  final _verticalPadding = RoofUIDistance.b;
  final _imagePaddingRight = RoofUIDistance.b;
  final _detailPaddingTop = RoofUIDistance.a;

  Body(
      {Key key,
      @required this.titleText,
      @required this.assetReference,
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
                  child: RoofUIStandardizedIcon(assetReference: assetReference)),

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
