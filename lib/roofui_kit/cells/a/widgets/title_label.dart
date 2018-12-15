import 'package:flutter/material.dart';
import 'package:roof/roofui_kit/roofui_color.dart';
import 'package:roof/roofui_kit/roofui_font_size.dart';
import 'package:roof/roofui_kit/roofui_font_weight.dart';

class TitleLabel extends StatelessWidget {
  final String text;
  const TitleLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: RoofUIColor.neutralColorGradientG,
            fontSize: RoofUIFontSize.medium,
            fontWeight: RoofUIFontWeight.thick));
  }
}
