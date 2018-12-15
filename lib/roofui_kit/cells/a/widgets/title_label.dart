import 'package:flutter/material.dart';
import 'package:roof/util/decorated_text.dart';
import 'package:roof/roofui_kit/roofui_color.dart';
import 'package:roof/roofui_kit/roofui_font_weight.dart';
import 'package:roof/roofui_kit/roofui_font_size.dart';

class TitleLabel extends StatelessWidget {
  final WeightDecoratedText decoratedText;

  final _defaultStyle = const TextStyle(
      color: RoofUIColor.neutralColorGradientG,
      fontSize: RoofUIFontSize.medium,
      fontWeight: RoofUIFontWeight.thick);

  final _thinStyle = const TextStyle(
      color: RoofUIColor.neutralColorGradientG,
      fontSize: RoofUIFontSize.medium,
      fontWeight: RoofUIFontWeight.thin);

  const TitleLabel({Key key, @required this.decoratedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return decoratedText.generateWidget(
        defaultStyle: _defaultStyle, thinStyle: _thinStyle);
  }
}
