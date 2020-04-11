import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:spaced_column_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';

abstract class SpacedColumnVerticalFloatingArtboard extends StatefulWidget
    with VerticalFloatingArtboard, Artboard, SpacedColumnBuilder {
  String get title;

  List<Widget> Function(BuildContext) get buildSpacedColumnChildren;

  List<Widget> buildBody(BuildContext context) => null;

  @override
  State<StatefulWidget> createState() =>
      _SpacedColumnVerticalFloatingArtboardState();
}

class _SpacedColumnVerticalFloatingArtboardState
    extends State<SpacedColumnVerticalFloatingArtboard>
    with VerticalFloatingArtboardState<SpacedColumnVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> children = [];

    if (widget.title != null) {
      final title = Text(
        widget.title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      );
      children.add(
        Padding(
          child: title,
          padding: EdgeInsets.symmetric(
            vertical: theme.distance.spacing.vertical.medium,
          ),
        ),
      );
    }

    if (widget.buildBody(context) != null)
      children.addAll(
        widget.buildBody(context).toList(),
      );

    if (widget.buildSpacedColumnChildren != null)
      children.add(
        widget.buildSpacedColumn(
          context,
          children: widget.buildSpacedColumnChildren(context),
        ),
      );

    return Column(
      children: children,
    );
  }
}
