import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';
import 'package:verify_sole_proprietorship_wallet_artboard/index.dart';
import 'package:verify_business_wallet_artboard/index.dart';

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
              onTap: () => ArtboardNavigator.of(context).goTo(
                VerifySoleProprietorshipWalletVerticalFloatingArtboard(),
              ),
              text: "Sole proprietorship",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => ArtboardNavigator.of(context).goTo(
                VerifyBusinessWalletVerticalFloatingArtboard(),
              ),
              text: "Partnership",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => ArtboardNavigator.of(context).goTo(
                VerifyBusinessWalletVerticalFloatingArtboard(),
              ),
              text: "LLC",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => ArtboardNavigator.of(context).goTo(
                VerifyBusinessWalletVerticalFloatingArtboard(),
              ),
              text: "Corporation",
            ),
          ];
}
