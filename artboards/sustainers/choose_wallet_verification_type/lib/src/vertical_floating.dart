import 'package:button_builder/index.dart';
import 'package:choose_business_type_artboard/index.dart';
import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';
import 'package:verify_personal_wallet_artboard/index.dart';

class ChooseWalletVerificationTypeVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with SecondaryCenterButtonBuilder {
  @override
  String get title => "How will you use this wallet?";

  @override
  List<Widget> Function(BuildContext) get buildSpacedColumnChildren =>
      (context) => [
            buildSecondaryCenterButton(
              context,
              onTap: () => ArtboardNavigator.of(context)
                  .goTo(VerifyPersonalWalletVerticalFloatingArtboard()),
              text: "As a person",
            ),
            buildSecondaryCenterButton(
              context,
              onTap: () => ArtboardNavigator.of(context).goTo(
                ChooseBusinessTypeVerticalFloatingArtboard(),
              ),
              text: "As a business",
            ),
          ];
}
