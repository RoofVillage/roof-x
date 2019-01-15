import 'package:flutter/material.dart';
import 'package:roof/util/icon_map.dart';
import 'package:roofui_kit/scaffold/index.dart';
import 'package:roofui_kit/forms/roofui_standard_form.dart';

import 'widgets/list.dart';

// Create a stateful widget
class Auth extends StatelessWidget {
  Widget build(BuildContext context) {
    Widget loginForm = StandardForm(
        centered: true,
        titleText: "Log in",
        subtitleText: "So you can use this sexy app",
        autofocus: true,
        fields: [
          {
            "type": "text",
            "fieldNameText": "Email address",
            "placeholderText": "shooomie@emailz.io"
          },
          {
            "type": "password", 
            "fieldNameText": "Password"
          },
          {
            "type": "textArea",
            "fieldNameText": "Note",
            "placeholderText": "Say something loooong"
          }
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
