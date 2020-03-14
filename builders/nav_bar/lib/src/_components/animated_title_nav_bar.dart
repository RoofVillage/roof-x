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
  final bool hideOnScroll;

  AnimatedTitleNavBar({
    @required this.scrollController,
    this.actionButtons,
    this.navButton,
    this.title,
    this.hideOnScroll,
  });

  @override
  _AnimatedTitleNavBarState createState() => _AnimatedTitleNavBarState();
}

class _AnimatedTitleNavBarState extends State<AnimatedTitleNavBar> {
  final _containerKey = GlobalKey();

  // titleCanShow pattern prevents titleVisible being set to true while scrollPosition is near 0, and scroll direction is up. This is intended to allow adequate scroll distance for the navBar to hide on initial scroll-up before title becomes visible.
  bool _titleCanShow = true;
  bool _titleVisible = false;
  double _containerHeight;

  double get _titleVisibilityOffset => _containerHeight - 25;

  @override
  void initState() {
    if (widget.hideOnScroll == true) _titleCanShow = false;

    widget.scrollController.addListener(() => _updateTitleVisibleOnScroll());

    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _setContainerHeight(),
    );
    super.initState();
  }

  void _updateTitleVisibleOnScroll() {
    bool newTitleCanShow;
    bool newTitleVisible;

    final scrollPosition = widget.scrollController.offset;

    newTitleVisible =
        scrollPosition >= _titleVisibilityOffset && _titleCanShow == true;

    if (widget.hideOnScroll == true) {
      if (scrollPosition > _titleVisibilityOffset * 2)
        newTitleCanShow = true;
      else if (scrollPosition <= _titleVisibilityOffset)
        newTitleCanShow = false;
    }

    if (_titleVisible == newTitleVisible && _titleCanShow == newTitleCanShow)
      return;

    setState(() {
      if (_titleVisible != newTitleVisible && newTitleVisible != null)
        _titleVisible = newTitleVisible;
      if (_titleCanShow != newTitleCanShow && newTitleCanShow != null)
        _titleCanShow = newTitleCanShow;
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
