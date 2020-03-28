import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';

class AddWalletVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with SecondaryCenterButtonBuilder {
  @override
  String get title => "Add a new wallet";

  @override
  List<Widget> Function(BuildContext) get buildSpacedColumnChildren =>
      (context) => [
            buildSecondaryCenterButton(
              context,
              onTap: () => print('Join wallet'),
              text: "Join",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => print('Create wallet'),
              text: "Create new",
            ),
          ];
}
