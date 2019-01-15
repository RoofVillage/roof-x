import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/fields/label/index.dart';

class RoofUITextArea extends StatelessWidget {
  final String fieldNameText;
  final String placeholderText;
  final String initialValueText;
  final TextInputAction textInputAction;

  const RoofUITextArea(
      {this.fieldNameText, this.placeholderText, this.initialValueText, this.textInputAction = TextInputAction.done});

  Widget build(BuildContext context) {
    return Container(
        margin: FieldStyle.standardFieldPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            RoofUIFieldLabel(labelText: fieldNameText),
            Container(margin: EdgeInsets.fromLTRB(0, RoofUIDistance.a, 0, 0),
            child: TextFormField(
              textInputAction: textInputAction,
              key: this.key,
              maxLines: 3,
              initialValue: initialValueText,
              decoration:
                  FieldStyle.textAreaDecoration(placeholderText: placeholderText),
            ))
          ]),
        );
  }
}
