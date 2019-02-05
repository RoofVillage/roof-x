import 'package:flutter/material.dart';
import 'package:button_components/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:form_artboard_mixin/index.dart';

import 'floating_artboard.dart';

abstract class FormFloatingArtboard extends FloatingArtboard with FormArtboard {
  final _headerStyle = RoofTypography.heading1;
  final _subtitleStyle = RoofTypography.body1a;

  final _bodyVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);

    final headerColor = theme.color.text.brand;
    final subtitleColor = theme.color.text.secondary;
    final headerStyle = _headerStyle.textStyleWithColor(headerColor);
    final subtitleStyle = _subtitleStyle.textStyleWithColor(subtitleColor);

    final submitButton =
        RoofSubmitButton(text: submitButtonText, onTap: form.submit);

    return <Widget>[
      Text(title, style: headerStyle),
      Text(subtitle, style: subtitleStyle),
      Padding(padding: _bodyVerticalPadding, child: buildForm(context)),
      Padding(padding: _buttonVerticalPadding, child: submitButton)
    ];
  }
}
