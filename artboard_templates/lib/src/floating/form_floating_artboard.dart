import 'package:flutter/material.dart';
import 'package:button_components/index.dart';
import 'package:roof_form/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'floating_artboard.dart';

abstract class FormFloatingArtboard extends FloatingArtboard {
  String get title;
  String get subtitle;
  String get submitButtonText;
  List<StreamableFormFieldData> get fieldData;

  String get address;
  Map<String, dynamic> get params;

  final _headerStyle = RoofTypography.heading1;
  final _subtitleStyle = RoofTypography.body1a;

  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);
    
    final headerColor = theme.color.text.brand;
    final subtitleColor = theme.color.text.secondary;
    final headerStyle = _headerStyle.textStyleWithColor(headerColor);
    final subtitleStyle = _subtitleStyle.textStyleWithColor(subtitleColor);

    final bodyVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
    final buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

    final form = RoofStreamForm(
        initialFormData: Future<SpacedStreamableFormData>.value(
            SpacedStreamableFormData.withFields(
          fieldData: fieldData,
        )),
        getAddress: () => address,
        getParams: () => params);

    final submitButton = RoofSubmitButton(
        text: submitButtonText, onTap: () => form.onSubmit(context));

    return <Widget>[
      Text(title, style: headerStyle),
      Text(subtitle, style: subtitleStyle),
      Padding(padding: bodyVerticalPadding, child: form),
      Padding(padding: buttonVerticalPadding, child: submitButton)
    ];
  }
}
