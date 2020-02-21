import 'package:flutter/material.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:stream_list_view_vertical_full_screen_artboard_template/index.dart';
import 'package:view_stream_builder_builder/index.dart';

import '_data.dart';

class DomainsVerticalFullscreenArtboard
    extends StreamListViewVerticalFullScreenArtboard<LandlordProfilesView>
    with DomainsArtboardData, ViewStreamBuilderBuilder, SpacedListViewBuilder {
  @override
  Widget emptyStateWidget(BuildContext context) => Text('empty');

  @override
  Widget loadingStateWidget(BuildContext context) => Text('loading');

  @override
  List<Widget> listViewChildren(BuildContext context, streamSnapshot) {
    final theme = SemanticTheme.of(context);

    return streamSnapshot.profiles.map<Widget>(
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
  }
}
