import 'package:flutter/material.dart';
import 'package:spec/field_styles.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/distance.dart';
import 'package:spec/fields/widgets/_field_label.dart';

class RoofTextArea extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool autofocus;
  final TextInputAction textInputAction;

  const RoofTextArea(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.autofocus = false,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      Widget fieldLabel = RoofFieldLabel(labelText: fieldName);
      fieldChildren.add(fieldLabel);
    }

    Widget fieldBody = Container(
        margin: EdgeInsets.fromLTRB(0, RoofDistance.a, 0, 0),
        child: TextFormField(
          textInputAction: textInputAction,
          maxLines: 3,
          initialValue: initialValue,
          decoration:
              RoofFieldStyle.textAreaDecoration(placeholder: placeholder),
        ));

    fieldChildren.add(fieldBody);

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}
