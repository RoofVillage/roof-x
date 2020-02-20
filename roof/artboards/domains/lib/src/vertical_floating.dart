import 'package:flutter/material.dart';
import 'package:cells_list_view_builder/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:header_empty_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';

import '_data.dart';

class DomainsVerticalFullscreenArtboard
    extends HeaderEmptyVerticalFullScreenArtboard
    with DomainsArtboardData, ViewStreamBuilderBuilder, CellsListViewBuilder {
  @override
  List<Widget> artboardActionButtons(BuildContext context) {
    return [
      NavigationIcon.add.buildWidget(
        color: SemanticTheme.of(context).color.icon.nav,
      )
    ];
  }

  @override
  Widget artboardNavButton(BuildContext context) {
    return NavigationIcon.backArrow.buildWidget(
      color: SemanticTheme.of(context).color.icon.nav,
    );
  }

  @override
  String get artboardTitle => "Your landlord profiles";

  @override
  Widget artboardBody(BuildContext context) {
    return buildViewStreamBuilder<LandlordProfilesView>(
      context,
      stream: data,
      loading: Text('loading'),
      empty: Text('empty'),
      child: (context, LandlordProfilesView snapshot) {
        final theme = SemanticTheme.of(context);

        final List<Widget> cells = snapshot.profiles.map<Widget>(
          (profile) {
            final List<Widget> rowChildren = [];

            final nameText = Text(
              profile.name,
              style: theme.typography.title.textStyle(
                color: theme.color.text.generalPrimary,
              ),
            );

            if (profile.notificationCount != null &&
                profile.notificationCount > 0) {
              final notificationText = Text(
                profile.notificationCount.toString(),
                style: theme.typography.bodyHeavy.textStyle(
                  color: theme.color.text.action,
                ),
              );
              rowChildren.addAll([
                Expanded(
                  child: nameText,
                ),
                notificationText,
              ]);
            } else {
              rowChildren.add(nameText);
            }

            return Container(
              margin: EdgeInsets.only(
                bottom: theme.distance.spacing.vertical.small,
                left: theme.distance.gutter.horizontal.small,
                right: theme.distance.gutter.horizontal.small,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: theme.distance.padding.horizontal.medium,
                vertical: theme.distance.padding.vertical.medium,
              ),
              decoration: BoxDecoration(
                color: theme.color.background.generalPrimary,
                borderRadius: BorderRadius.all(theme.radius.medium),
              ),
              child: Row(
                children: rowChildren,
              ),
            );
          },
        ).toList();

        return Column(children: cells);
      },
    );
  }
}
