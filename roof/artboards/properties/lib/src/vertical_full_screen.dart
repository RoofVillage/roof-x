import 'package:flutter/material.dart';
import 'package:landlord_nav_drawer_artboard/index.dart';
import 'package:nav_button_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:navigator/index.dart';
import 'package:roof_table_cell_builder/index.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:stream_list_view_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';

import '_data.dart';

class PropertiesVerticalFullscreenArtboard
    extends StreamListViewVerticalFullScreenArtboard<PropertiesView>
    with
        PropertiesArtboardData,
        IconNavButtonBuilder,
        ViewStreamBuilderBuilder,
        SpacedListViewBuilder,
        PropertyCellBuilder {
  Widget artboardNavButton(BuildContext context) => buildIconNavButton(
        iconReference: NavigationIcon.backArrow,
        onTap: () => ArtboardNavigator.of(context).pop(),
      );

  @override
  Widget emptyStateWidget(BuildContext context) => Text('empty');

  @override
  Widget loadingStateWidget(BuildContext context) => Text('loading');

  @override
  List<Widget> listViewChildren(
    BuildContext context,
    PropertiesView streamSnapshot,
  ) {
    return streamSnapshot.properties
        .map(
          (property) => buildPropertyCell(property: property),
        )
        .toList();
  }
}
