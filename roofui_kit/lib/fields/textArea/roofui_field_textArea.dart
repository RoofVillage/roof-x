import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/fields/widgets/index.dart';

class _RoofUITextAreaState extends State<RoofUITextArea> {
  String fieldNameText;
  String placeholderText;
  String initialValueText;
  bool autofocus;
  TextInputAction textInputAction;

  _RoofUITextAreaState(
      {Key key,
      this.fieldNameText,
      this.placeholderText,
      this.initialValueText,
      this.autofocus,
      this.textInputAction});

  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldNameText != null)
      fieldChildren.add(RoofUIFieldLabel(labelText: fieldNameText));

    fieldChildren.add(Container(
        margin: EdgeInsets.fromLTRB(0, RoofUIDistance.a, 0, 0),
        child: TextFormField(
          textInputAction: textInputAction,
          maxLines: 3,
          initialValue: initialValueText,
          decoration:
              FieldStyle.textAreaDecoration(placeholderText: placeholderText),
        )));

    return Container(
      margin: FieldStyle.standardFieldPadding(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fieldChildren),
    );
  }
}

class RoofUITextArea extends StatefulWidget {
  final String fieldNameText;
  final String placeholderText;
  final String initialValueText;
  final bool autofocus;
  final TextInputAction textInputAction;

  const RoofUITextArea(
      {this.fieldNameText,
      this.placeholderText,
      this.initialValueText,
      this.autofocus = false,
      this.textInputAction});

  @override
  _RoofUITextAreaState createState() => _RoofUITextAreaState(
      fieldNameText: fieldNameText,
      placeholderText: placeholderText,
      initialValueText: initialValueText,
      autofocus: autofocus,
      textInputAction: textInputAction);
}
