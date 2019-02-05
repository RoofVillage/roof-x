import 'package:flutter/material.dart';
import 'package:button_components/index.dart';

import 'widgets/index.dart';

import 'floating_artboard.dart';

abstract class FormFloatingArtboard extends FloatingArtboard with FormArtboard {
  @override
  List<Widget> buildChildren(BuildContext context) {
    //Create a submit button that submits the form.
    final submitButton =
        RoofSubmitButton(text: submitButtonText, onTap: form.submit);

    return <Widget>[
      Text(title),
      Text(subtitle),
      buildForm(context),
      Container(height: 20),
      submitButton
    ];
  }
}
