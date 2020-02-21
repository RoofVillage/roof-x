import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'package:standard_icon_library/index.dart';

import 'nav_bar.dart';
import '_widgets/nav_title_baseline.dart';

class TitleNavBar extends StatelessWidget with NavBar {
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;
  final String subtitle;
  final StandardIcon icon;

  TitleNavBar({
    this.navButton,
    this.title,
    this.subtitle,
    this.actionButtons,
    this.icon,
  });

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> navigationWidgets = [];

    if (navButton != null) {
      navigationWidgets.add(
        Padding(
          padding: EdgeInsets.only(
            right: theme.distance.spacing.horizontal.small,
          ),
          child: navButton,
        ),
      );
    }

    if (icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(
          right: theme.distance.spacing.horizontal.medium,
        ),
        child: icon.buildWidget(
          color: theme.color.icon.logo,
        ),
      );
      navigationWidgets.add(paddedIconWidget);
    }

    if (title != null || subtitle != null) {
      navigationWidgets.add(
        _buildTitleColumn(theme),
      );
    }

    return navigationWidgets;
  }

  Widget _buildTitleColumn(SemanticThemeData theme) {
    final List<Widget> titleColumnChildren = [];

    if (title != null) {
      final titleWidget = Text(
        title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.brand,
        ),
        overflow: TextOverflow.ellipsis,
      );
      titleColumnChildren.add(
        NavTitleBaseline(
          text: titleWidget,
          baseline: theme.typography.title.fontSize,
        ),
      );
    }

    if (subtitle != null) {
      final subtitleWidget = Text(
        subtitle,
        style: theme.typography.subtitle.textStyle(
          color: theme.color.text.generalSecondary,
        ),
        overflow: TextOverflow.ellipsis,
      );
      titleColumnChildren.add(subtitleWidget);
    }

    return Column(
      children: titleColumnChildren,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
