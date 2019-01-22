import 'package:flutter/material.dart';
import 'package:spec/field_styles.dart';

class RoofFieldLabel extends StatelessWidget {
  final String labelText;
  final int maxLines;

  RoofFieldLabel({Key key, this.labelText, this.maxLines = 1})
      : super(key: key);

  Widget build(BuildContext context) {
    return Text(labelText,
        softWrap: true,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: RoofFieldStyle.labelStyle());
  }
}
