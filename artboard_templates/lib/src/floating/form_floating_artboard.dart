import 'package:flutter/material.dart';
import 'package:button_components/index.dart';
import 'package:roof_form/index.dart';

import 'floating_artboard.dart';

abstract class FormFloatingArtboard extends FloatingArtboard {
  String get title;
  String get subtitle;
  String get submitButtonText;
  List<StreamableFormFieldData> get fieldData;

  String get address;
  Map<String, dynamic> get params;

  @override
  List<Widget> buildChildren(BuildContext context) {
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
      Text(title),
      Text(subtitle),
      form,
      Container(height: 20),
      submitButton
    ];
  }
}
