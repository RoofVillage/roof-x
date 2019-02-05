import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';
import 'package:artboard_mixins/index.dart';

import 'widgets/index.dart';
import 'full_screen_artboard.dart';

abstract class FullLogoTableFullScreenArtboard extends FullScreenArtboard
    with TableArtboard {
  List<RoofNavButton> get actionButtons => [];

  get _navBar => RoofFullLogoNavBar(actionButtons: actionButtons);

  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNav(navBar: _navBar, body: buildTable(context));
  }
}
