import 'package:flutter/material.dart';
import 'package:empty_table_vertical_full_screen_artboard_template/index.dart';
import 'package:form_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:spaced_column_builder/index.dart';

import '_data.dart';

class AuthSetFactorsVerticalFloatingArtboard
    extends EmptyTableVerticalFullScreenArtboard
    with
        AuthSetFactorsArtboardData,
        SpacedColumnBuilder,
        PrimaryLeftButtonBuilder,
        SecondaryCenterButtonBuilder,
        KeyValueRowBuilder {
  void _setPhoneNumber(BuildContext context) {
    print('NAVVin to set phone number');
    // ArtboardNavigator.of(context).goTo();
  }

  Widget buildDock(BuildContext context) => buildSpacedColumn(
        context,
        children: [
          buildKeyValueRow(
            context,
            title: "Email address",
            value: "your email",
          ),
          buildKeyValueRow(
            context,
            title: "Phone number",
            value: "not set",
          ),
          buildSecondaryCenterButton(
            context,
            text: "Set phone number",
            onTap: () => _setPhoneNumber(context),
          ),
          buildKeyValueRow(
            context,
            title: "Password",
            value: "not set",
          ),
          buildSecondaryCenterButton(
            context,
            text: "Set password",
            onTap: () => _setPhoneNumber(context),
          ),
        ],
      );
}
