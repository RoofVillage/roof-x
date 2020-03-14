import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';

import '_widgets/nav_title_baseline.dart';

class AnimatedTitleNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;

  AnimatedTitleNavBar({
    @required this.scrollController,
    this.actionButtons,
    this.navButton,
    this.title,
  });

  @override
  _AnimatedTitleNavBarState createState() => _AnimatedTitleNavBarState();
}

class _AnimatedTitleNavBarState extends State<AnimatedTitleNavBar> {
  final _containerKey = GlobalKey();

  bool _titleVisible = false;
  double _containerHeight;

  double get _opacityChangeOffset => _containerHeight - 25;

  @override
  void initState() {
    widget.scrollController.addListener(() => _updateTitleVisibleOnScroll());

    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _setContainerHeight(),
    );
    super.initState();
  }

  void _updateTitleVisibleOnScroll() {
    bool newTitleVisible =
        widget.scrollController.offset >= _opacityChangeOffset ? true : false;

    if (_titleVisible == newTitleVisible) return;

    setState(() {
      _titleVisible = newTitleVisible;
    });
  }

  void _setContainerHeight() {
    final containerContext = _containerKey.currentContext;

    if (containerContext == null) return;

    setState(() {
      _containerHeight = containerContext.size.height ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    if (theme.systemUiStyle.systemUiOverlayStyle.value != null) {
      SystemChrome.setSystemUIOverlayStyle(
        theme.systemUiStyle.systemUiOverlayStyle.value,
      );
    }

    final List<Widget> rowChildren = [];

    if (widget.navButton != null) {
      final spacedNavButton = Padding(
        padding: EdgeInsets.only(right: theme.distance.spacing.horizontal.min),
        child: widget.navButton,
      );

      rowChildren.add(spacedNavButton);
    }

    if (widget.title != null) {
      final opacityTitle = AnimatedOpacity(
        opacity: _titleVisible ? 1 : 0,
        curve: theme.curve.normal,
        duration: theme.duration.medium,
        child: NavTitleBaseline(
          text: Text(
            widget.title,
            style: theme.typography.title.textStyle(
              color: theme.color.text.generalPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          baseline: theme.typography.title.fontSize,
        ),
      );

      rowChildren.add(
        Expanded(child: opacityTitle),
      );
    } else {
      rowChildren.add(Expanded(
        child: Container(),
      ));
    }

    if (widget.actionButtons != null) {
      final spacedActionButtons = widget.actionButtons
          .map(
            (button) => Padding(
              child: button,
              padding: EdgeInsets.only(
                left: theme.distance.spacing.horizontal.min,
              ),
            ),
          )
          .toList();

      rowChildren.add(
        Row(children: spacedActionButtons),
      );
    }

    final itemRow = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: rowChildren),
      ],
    );

    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Container(
      key: _containerKey,
      padding: EdgeInsets.fromLTRB(
        theme.distance.gutter.horizontal.small,
        theme.distance.gutter.vertical.small + safeAreaTop,
        theme.distance.gutter.horizontal.small,
        theme.distance.gutter.vertical.small,
      ),
      decoration: BoxDecoration(
        color: theme.color.background.generalSecondary,
      ),
      child: itemRow,
    );
  }
}
