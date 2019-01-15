import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';

class RoofUIFieldLabel extends StatelessWidget {
  final String labelText;

  RoofUIFieldLabel({Key key, this.labelText}) : super(key: key);

  Widget build(BuildContext context) {
    return (Text(labelText,
        style: FieldStyle.labelStyle()));
  }
}
