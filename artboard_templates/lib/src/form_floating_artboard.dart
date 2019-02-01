import 'package:flutter/material.dart';
import 'package:button_components/index.dart';

import 'floating_artboard.dart';

abstract class FormFloatingArtboard extends FloatingArtboard {
  WidgetBuilder get buildBody;
  String get title;
  String get subtitle;
  String get submitButtonText;
  Function get submitButtonAction;
  String get threadButtonText;
  Function get threadButtonAction;
  String get backButtonText;
  Function get backButtonAction;

  @override
  List<Widget> buildChildren(BuildContext context) {
    final submitButton = RoofSubmitButton(
        text: submitButtonText, onTap: () => submitButtonAction(context));
    final threadButton = RoofTransitionButton(
        text: threadButtonText, onTap: () => threadButtonAction(context));
    final backButton = RoofTransitionButton(
        text: backButtonText, onTap: () => backButtonAction(context));

    return <Widget>[
      Text(title),
      Text(subtitle),
      buildBody(context),
      Container(height: 20),
      submitButton,
      threadButton,
      backButton
    ];
  }
}
