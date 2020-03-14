import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semantic_theme/index.dart';

class SpacedSliverList extends StatefulWidget {
  final List<Widget> children;
  final double horizontalGutter;
  final double spacing;

  SpacedSliverList({
    this.children,
    this.horizontalGutter,
    this.spacing,
  });

  @override
  _SpacedSliverListState createState() => _SpacedSliverListState();
}

class _SpacedSliverListState extends State<SpacedSliverList> {
  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final spacing = widget.spacing ?? theme.distance.spacing.vertical.medium;
    final horizontalGutter =
        widget.horizontalGutter ?? theme.distance.gutter.horizontal.medium;

    List<Widget> spacedChildren = widget.children
        .map(
          (child) => child == widget.children.last
              ? child
              : Padding(
                  child: child,
                  padding: EdgeInsets.only(
                    bottom: spacing,
                  ),
                ),
        )
        .toList();

    return SliverPadding(
      sliver: SliverList(
        delegate: SliverChildListDelegate(spacedChildren),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalGutter,
      ),
    );
  }
}
