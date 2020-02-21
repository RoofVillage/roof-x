import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:inherited_scroll_controller_builder/index.dart';
import 'package:semantic_theme/index.dart';

import '_widgets/nav_title_baseline.dart';

class AnimatedTitleNavBar extends StatefulWidget {
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;

  AnimatedTitleNavBar({
    this.actionButtons,
    this.navButton,
    this.title,
  });

  @override
  _AnimatedTitleNavBarState createState() => _AnimatedTitleNavBarState();
}

class _AnimatedTitleNavBarState extends State<AnimatedTitleNavBar> {
  final _containerKey = GlobalKey();
  final _opacityChangeScrollDistance = 30;

  ScrollController _scrollController;
  double _opacity = 0;
  double _containerHeight = 100;

  double get _opacityChangeStartOffset =>
      _containerHeight - _opacityChangeScrollDistance;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _setContainerHeight(),
    );
    super.initState();
  }

  @override
  didChangeDependencies() {
    _scrollController = InheritedScrollController.of(context);
    assert(_scrollController != null);

    _scrollController.addListener(() => _updateOpacityOnScroll());
    super.didChangeDependencies();
  }

  void _updateOpacityOnScroll() {
    double newOpacity;

    if (_scrollController.offset < _opacityChangeStartOffset) {
      newOpacity = 0;
    } else if (_scrollController.offset < _containerHeight) {
      newOpacity = (_scrollController.offset - _opacityChangeStartOffset) /
          _opacityChangeScrollDistance;
    } else if (_opacity != 1) {
      newOpacity = 1;
    }

    if (newOpacity != null) {
      setState(() {
        _opacity = newOpacity;
      });
    }
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
      final opacityTitle = Opacity(
        opacity: _opacity,
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
