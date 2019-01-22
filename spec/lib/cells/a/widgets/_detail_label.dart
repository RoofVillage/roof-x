import 'package:flutter/material.dart';

import 'package:spec/color.dart';
import 'package:spec/font_size.dart';
import 'package:spec/font_weight.dart';

class DetailLabel extends StatelessWidget {
  final String text;

  final _style = const TextStyle(
      color: RoofColor.neutralColorG,
      fontSize: RoofFontSize.medium,
      fontWeight: RoofFontWeight.thin);

  const DetailLabel({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: _style);
  }
}
