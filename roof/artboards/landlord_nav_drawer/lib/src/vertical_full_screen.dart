import 'package:flutter/material.dart';
import 'package:nav_vertical_drawer_artboard_template/index.dart';
import 'package:properties_artboard/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';

import '_data.dart';

class LandlordNavVerticalDrawerArtboard extends NavVerticalDrawerArtboard
    with LandlordVerticalNavArtboardData {
  @override
  List<ArtboardNavButtonConfig> get bodyNavButtons => [
        ArtboardNavButtonConfig(
          artboard: PropertiesVerticalFullscreenArtboard(),
          title: "Properties",
          icon: StandardIcon.camper,
        ),
        ArtboardNavButtonConfig(
          artboard: null,
          title: "Invoices",
          icon: StandardIcon.cashSack,
          badgeText: "7",
        ),
        ArtboardNavButtonConfig(
          artboard: null,
          title: "Maintenance",
          icon: StandardIcon.toolbox,
        ),
        ArtboardNavButtonConfig(
          artboard: null,
          title: "Settings",
          icon: StandardIcon.settings,
        ),
      ];

  @override
  Widget buildDock(BuildContext context) => null;

  @override
  Widget buildHeader(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.color.stroke.light,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.distance.gutter.horizontal.medium,
            vertical: theme.distance.gutter.vertical.large,
          ),
          child: Text(
            'Something sexy',
            style: theme.typography.title.textStyle(
              color: theme.color.text.generalPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
