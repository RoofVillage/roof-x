import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';

import '_data.dart';

class SecretKeyVerticalFloatingArtboard extends SpacedColumnVerticalFloatingArtboard
    with SecretKeyArtboardData, SecondaryCenterButtonBuilder {
  final String secretKey;

  SecretKeyVerticalFloatingArtboard({@required this.secretKey});

  @override
  List<Widget> Function(BuildContext) get buildSpacedColumnChildren =>
      (BuildContext context) => [
            buildSecondaryCenterButton(
              context,
              text: "Copy to clipboard",
              onTap: () => print('copying $secretKey'),
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
