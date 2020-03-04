import 'package:button_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:vertical_drawer_artboard_scaffold/index.dart';

abstract class NavVerticalDrawerArtboard extends StatefulWidget
    with VerticalDrawerArtboard, Artboard, PrimaryListButtonBuilder {
  List<ArtboardNavButtonConfig> get bodyNavButtons;

  @override
  Widget buildBody(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final goTo = ArtboardNavigator.of(context).goTo;

    final buttons = bodyNavButtons
        .map(
          (button) => buildPrimaryListButton(context,
              onTap: (_) => goTo(button.artboard),
              text: button.title,
              badgeText: button.badgeText,
              iconReference: button.icon),
        )
        .toList();

    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.large,
        horizontal: theme.distance.padding.horizontal.medium,
      ),
      children: buttons,
    );
  }
}

class ArtboardNavButtonConfig {
  final Artboard artboard;
  final StandardIcon icon;
  final String title;
  final String badgeText;

  ArtboardNavButtonConfig({
    @required this.artboard,
    this.icon,
    this.title,
    this.badgeText,
  });
}
