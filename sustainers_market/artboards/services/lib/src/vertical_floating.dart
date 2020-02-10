import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:titled_table_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';
import 'package:views/index.dart';
import 'package:navigator/index.dart';
import 'package:semantic_theme/index.dart';

import '_data.dart';

class ServicesVerticalFloatingArtboard
    extends TitledVerticalFullTableScreenArtboard
    with ServicesArtboardData, ViewStreamBuilderBuilder {
  final List<String> pendingServiceNames;

  ServicesVerticalFloatingArtboard({this.pendingServiceNames});

  @override
  Widget buildBody(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Row> serviceRows(UserServicesView view) => view.services
        .map(
          (service) => Row(
            children: [
              GestureDetector(
                onTap: () => onServiceTap(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.distance.padding.vertical.medium,
                    horizontal: theme.distance.padding.horizontal.medium,
                  ),
                  child: Text(
                    service.name,
                    style: theme.typography.title.textStyle(
                      color: theme.color.text.generalPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();

    final List<Row> pendingServices = pendingServiceNames
        .map(
          (serviceName) => Row(
            children: [
              GestureDetector(
                onTap: () => onServiceTap(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: theme.distance.padding.vertical.medium,
                    horizontal: theme.distance.padding.horizontal.medium,
                  ),
                  child: Text(
                    serviceName + " (loading)",
                    style: theme.typography.title.textStyle(
                      color: theme.color.text.generalPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        .toList();

    return buildViewStreamBuilder<UserServicesView>(
      context,
      stream: servicesView,
      loading: Text(
        'loadin',
        style: TextStyle(color: Colors.white70),
      ),
      empty: Text(
        'nothin',
        style: TextStyle(color: Colors.white70),
      ),
      child: (context, view) => ListView(
        children: [
          ...serviceRows(view),
          ...pendingServices,
        ],
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.small,
        ),
      ),
    );
  }

  @override
  Widget artboardNavButton(BuildContext context) => GestureDetector(
        child: NavigationIcon.backArrow.buildWidget(
          color: SemanticTheme.of(context).color.icon.nav,
        ),
        onTap: () => ArtboardNavigator.of(context).pop(),
      );

  @override
  String get artboardTitle => "Services";

  @override
  String get artboardSubtitle => null;

  @override
  List<Widget> artboardActionButtons(BuildContext context) {
    return null;
  }
}
