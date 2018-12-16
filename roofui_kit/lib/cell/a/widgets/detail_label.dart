import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_font_size.dart';
import 'package:roofui_kit/util/roofui_font_weight.dart';

class DetailLabel extends StatelessWidget {
  final String text;

  final _style = const TextStyle(
      color: RoofUIColor.neutralColorG,
      fontSize: RoofUIFontSize.medium,
      fontWeight: RoofUIFontWeight.thin);

  const DetailLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: _style);
  }
}
