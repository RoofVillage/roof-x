import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';

import 'widgets/index.dart';
import 'full_screen_artboard.dart';

abstract class FullLogoFullScreenArtboard extends FullScreenArtboard {
  WidgetBuilder get buildBody;
  List<RoofNavButton> get actionButtons => [];

  get _navBar => RoofFullLogoNavBar(actionButtons: actionButtons);

  @override
  Widget buildChild(BuildContext context) {
    return FullScreenWithNav(navBar: _navBar, body: buildBody(context));
  }
}
