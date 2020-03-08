import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';

class ChooseBusinessTypeVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with SecondaryCenterButtonBuilder {
  @override
  String get title => "What type of business?";

  @override
  List<Widget> Function(BuildContext) get buildSpacedColumnChildren =>
      (context) => [
            buildSecondaryCenterButton(
              context,
              onTap: () => print('sole prop'),
              text: "Sole proprietorship",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => print('partnership'),
              text: "Partnership",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => print('LLC'),
              text: "LLC",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => print('Corporation'),
              text: "Corporation",
            ),
          ];
}
