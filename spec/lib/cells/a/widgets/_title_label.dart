import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';

import 'package:spec/color.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/font_size.dart';

class TitleLabel extends StatelessWidget {
  final WeightDecoratedText decoratedText;

  final _defaultStyle = const TextStyle(
      color: RoofColor.neutralColorG,
      fontSize: RoofFontSize.large,
      fontWeight: RoofFontWeight.thick);

  final _thinStyle = const TextStyle(
      color: RoofColor.neutralColorG,
      fontSize: RoofFontSize.large,
      fontWeight: RoofFontWeight.thin);

  const TitleLabel({Key key, @required this.decoratedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return decoratedText.generateWidget(
        defaultStyle: _defaultStyle,
        thinStyle: _thinStyle,
        textScaleFactor: MediaQuery.of(context).textScaleFactor);
  }
}
