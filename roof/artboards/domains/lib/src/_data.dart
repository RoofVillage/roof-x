import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:semantic_theme/index.dart';

mixin DomainsArtboardData {
  List<Widget> artboardActionButtons(BuildContext context) => [
        NavigationIcon.add.buildWidget(
          color: SemanticTheme.of(context).color.icon.nav,
        )
      ];

  Widget artboardNavButton(BuildContext context) =>
      NavigationIcon.backArrow.buildWidget(
        color: SemanticTheme.of(context).color.icon.nav,
      );

  String get artboardTitle => "Your landlord profiles";

  final stream = Stream.value(
    LandlordProfilesView([
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
      LandlordProfile("Mills Rentals", 7),
      LandlordProfile("Dallas Crash Pads", null),
      LandlordProfile("GN Company", 2),
    ]),
  );
}

class LandlordProfilesView {
  List<LandlordProfile> profiles;

  LandlordProfilesView(this.profiles);
}

class LandlordProfile {
  String name;
  int notificationCount;

  LandlordProfile(
    this.name,
    this.notificationCount,
  );
}
