import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:artboard/index.dart';

import 'full_screen_artboard.dart';
import '_scaffolds/full_screen_with_nav.dart';

abstract class TitledFullTableScreenArtboard extends StatefulWidget
    with Artboard, FullScreenArtboard, TableBuilder, TitledNavBarBuilder {
  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNav(
        navBar: buildTitledNavBar(context), body: buildTable(context));
  }
}
