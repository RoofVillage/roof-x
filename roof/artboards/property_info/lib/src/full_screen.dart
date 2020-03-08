import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:theme/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';
import 'package:button_builder/index.dart';
import 'package:tag_builder/index.dart';
import 'package:distance/index.dart' as distance;

import '_data.dart';

abstract class PropertyInfoVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with
        SecondaryCenterButtonBuilder,
        PropertyInfoArtboardData,
        TagBuilder,
        KeyValueRowBuilder {
  String get title => propertyTitle;

  // TODO pattern for including propertyIcon in title

  @override
  List<Widget> buildBody(BuildContext context) {
    final List<Widget> tagWidgets = [];

    for (String tag in tags) {
      final tagWidget = buildTag(
        context,
        text: tag,
      );

      tagWidgets.add(tagWidget);
    }

    final tagsWrap = TagsWrap(tagWidgets);

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );

    return [tagsWrap, paymentProfileInfoRow];
  }

  @override
  List<Widget> buildButtons(BuildContext context) {
    _goToEditArtboard() {
      // TODO nav to edit property form
    }

    final editButton = buildSecondaryCenterButton(
      context,
      text: "Edit property",
      onTap: _goToEditArtboard,
    );

    return [editButton];
  }
}

class TagsWrap extends StatelessWidget {
  final List<Widget> tags;

  TagsWrap(this.tags);

  final _spacing = distance.b;
  final _verticalMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            children: tags,
            runSpacing: _spacing,
            spacing: _spacing,
          )
        ],
      ),
    );
  }
}
