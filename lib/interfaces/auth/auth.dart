import 'package:flutter/material.dart';
import 'package:roof/util/icon_map.dart';
import 'package:roofui_kit/scaffold/index.dart';
import 'package:roofui_kit/fields/text/index.dart';
import 'package:roofui_kit/fields/textArea/index.dart';
import 'package:roofui_kit/forms/roofui_standard_form.dart';

import 'widgets/list.dart';

// Create a stateful widget
class Auth extends StatelessWidget {
  Widget build(BuildContext context) {
    Widget loginForm = StandardForm(
        centered: true,
        titleText: "Log in",
        subtitleText: "So you can use this sexy app",
        fields: [
          RoofUITextField(
            fieldNameText: "Email address",
            placeholderText: "bitch@roof.io",
          ),
          RoofUITextField(
            fieldNameText: "Password",
            placeholderText: "••••••••",
            isPassword: true,
          ),
          RoofUITextArea(
            fieldNameText: "Note",
            placeholderText: "Write a lot"
          )
        ]);

    return RoofUIScaffoldA(
        // body: AuthList(),
        body: ListView(
          children: <Widget>[loginForm],
        ),
        centerIconReference: CustomIconMap.logoFull,
        rightIconReference: StandardizedIconMap.info);
  }
}
