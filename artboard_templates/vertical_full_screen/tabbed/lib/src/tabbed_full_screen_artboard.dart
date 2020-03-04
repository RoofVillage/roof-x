import 'package:flutter/material.dart';
import 'package:nav_bar_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_full_screen_artboard_scaffold/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:tab/index.dart';

abstract class TabbedFullScreenArtboard extends StatefulWidget
    with
        VerticalFullScreenArtboard,
        Artboard,
        TitledIconNavBarBuilder,
        TabbedContainerBuilder {
  @override
  Widget buildNavBar(BuildContext context) => buildTitledIconNavBar(context);

  List<RoofTab> buildTabs(BuildContext context);

  @override
  Widget buildBody(BuildContext context) {
    final tabs = buildTabs(context);

    return buildTabbedContainer(
      context,
      tabs,
    );
  }
}
