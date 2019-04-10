import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:artboard/index.dart';

import 'utils/vertical_full_screen_artboard.dart';

abstract class FullLogoTableVerticalFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TableBuilder,
        FullLogoNavBarBuilder,
        IconNavButtonBuilder {
  @override
  Widget buildBody(BuildContext context) => buildTable(context);
  @override
  Widget buildNavBar(BuildContext context) => buildFullLogoNavBar(context);
}
