import 'package:flutter/material.dart';
import 'package:navigation_artboard_mixin/index.dart';
import 'package:table_artboard_mixin/index.dart';

import 'widgets/index.dart';

import 'full_screen_artboard.dart';

abstract class TitledFullTableScreenArtboard extends FullScreenArtboard
    with TableArtboard, TitledNavBarArtboard {
  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNav(navBar: navBar, body: buildTable(context));
  }
}
