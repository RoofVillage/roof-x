import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';

import 'widgets/index.dart';
import 'full_screen_artboard.dart';

abstract class FullLogoTableFullScreenArtboard extends FullScreenArtboard
    with TableBuilder, FullLogoNavBarBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNav(
        navBar: buildFullLogoNavBar(context), body: buildTable(context));
  }
}
