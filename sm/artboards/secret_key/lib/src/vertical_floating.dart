import 'package:button/index.dart';
import 'package:flutter/material.dart';
import 'package:stack_vertical_floating_artboard_template/index.dart';

import '_data.dart';

class SecretKeyVerticalFloatingArtboard extends StackVerticalFloatingArtboard
    with SecretKeyArtboardData {
  final String secretKey;

  SecretKeyVerticalFloatingArtboard({@required this.secretKey});

  @override
  List<Widget> get buttonStackButtons => [
        RoofSecondaryCenterButton(
          text: "Copy to clipboard",
          onTap: (_) => print('copying $secretKey'),
        ),
      ];

  @override
  List<Widget> buildBody(BuildContext context) {
    print("build");
    print("building for $secretKey");
    return [
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 40,
          ),
          child: Text(
            "Key: $secretKey",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'Azo',
            ),
          ),
        ),
      ),
    ];
  }

  @override
  String get title => "Secret key";
}
