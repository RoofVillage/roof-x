import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class NavHeader extends StatelessWidget {
  final String title;
  final Widget navButton;
  final List<Widget> actionButtons;

  NavHeader({
    this.title,
    this.navButton,
    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> columnChildren = [];

    if (navButton != null || actionButtons?.isNotEmpty != null) {
      columnChildren.add(
        _buildControlRow(theme),
      );
    }

    if (title != null) {
      final titleText = Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.padding.vertical.small,
        ),
        child: Text(
          title,
          style: theme.typography.headingPrimary.textStyle(
            color: theme.color.text.generalPrimary,
          ),
        ),
      );

      columnChildren.add(titleText);
    }

    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(
        theme.distance.padding.horizontal.min,
        theme.distance.padding.vertical.small + safeAreaTop,
        theme.distance.padding.horizontal.min,
        theme.distance.padding.vertical.min,
      ),
      child: Column(
        children: columnChildren,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _buildControlRow(SemanticThemeData theme) {
    final List<Widget> controlRowChildren = [];

    if (navButton != null) {
      controlRowChildren.add(navButton);
    }

    if (actionButtons != null && actionButtons.isNotEmpty) {
      final paddedActionButtons = actionButtons
          .map((button) => Padding(
                padding: EdgeInsets.only(
                  left: theme.distance.padding.horizontal.small,
                ),
                child: button,
              ))
          .toList();

      final actionButtonsContainer = Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: paddedActionButtons,
      );

      controlRowChildren.add(actionButtonsContainer);
    }

    return Row(
      children: controlRowChildren,
    );
  }
}
