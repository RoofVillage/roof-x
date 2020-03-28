import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';

class BalanceActionsVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with SecondaryCenterButtonBuilder {
  @override
  String get title => null;

  @override
  List<Widget> Function(BuildContext) get buildSpacedColumnChildren =>
      (context) => [
            buildSecondaryCenterButton(
              context,
              onTap: () => print('withdraw'),
              text: 'Make a withdrawal',
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => print('deposit'),
              text: 'Make a deposit',
            ),
          ];
}
