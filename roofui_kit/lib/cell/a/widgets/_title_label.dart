import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_decorated_text.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_font_weight.dart';
import 'package:roofui_kit/util/roofui_font_size.dart';

class TitleLabel extends StatelessWidget {
  final RoofUIWeightDecoratedText decoratedText;

  final _defaultStyle = const TextStyle(
      color: RoofUIColor.neutralColorG,
      fontSize: RoofUIFontSize.large,
      fontWeight: RoofUIFontWeight.thick);

  final _thinStyle = const TextStyle(
      color: RoofUIColor.neutralColorG,
      fontSize: RoofUIFontSize.large,
      fontWeight: RoofUIFontWeight.thin);

  const TitleLabel({Key key, @required this.decoratedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return decoratedText.generateWidget(
        defaultStyle: _defaultStyle,
        thinStyle: _thinStyle,
        textScaleFactor: MediaQuery.of(context).textScaleFactor);
  }
}
