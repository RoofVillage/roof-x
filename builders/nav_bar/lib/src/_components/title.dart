import 'package:flutter/material.dart';

import 'package:theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

import 'nav_bar.dart';
import '_widgets/nav_title_baseline.dart';

class RoofTitleNavBar extends StatelessWidget with RoofNavBar {
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;
  final String subtitle;
  final StandardIcon icon;

  RoofTitleNavBar({
    Key key,
    this.navButton,
    this.title,
    this.subtitle,
    this.actionButtons,
    this.icon,
  });

  final _titleTypographyStyle = typography.heading1;
  final _subtitleTypographyStyle = typography.detailSecondary;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> navigationWidgets = [];

    if (navButton != null) {
      navigationWidgets.add(navButton);
    }

    if (_buildTitleColumn(theme) != null) {
      navigationWidgets.add(_buildTitleColumn(theme));
    }

    if (icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(right: distance.b),
        child: icon.buildWidget(color: theme.color.icon.logo),
      );
      navigationWidgets.add(paddedIconWidget);
    }

    return navigationWidgets;
  }

  Widget _buildTitleColumn(RoofInheritedTheme theme) {
    if (title == null && subtitle == null) return null;

    final List<Widget> titleColumnChildren = [];

    if (title != null) {
      final titleWidget = Text(
        title,
        style: _titleTypographyStyle.textStyleWithColor(theme.color.text.brand),
        overflow: TextOverflow.ellipsis,
      );
      titleColumnChildren.add(NavTitleBaseline(text: titleWidget));
    }

    if (subtitle != null) {
      final subtitleWidget = Text(
        subtitle,
        style: _subtitleTypographyStyle
            .textStyleWithColor(theme.color.text.secondary),
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
