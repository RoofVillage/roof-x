import 'package:flutter/material.dart';

import 'package:spec/color.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/font_size.dart';

class TitleLabel extends StatelessWidget {
  final String text;

  final _style = const TextStyle(
      color: RoofColor.primary,
      fontSize: RoofFontSize.large,
      fontWeight: RoofFontWeight.thick);

  const TitleLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: _style);
  }
}
