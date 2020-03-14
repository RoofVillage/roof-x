import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:semantic_theme/index.dart';
import 'package:artboard/index.dart';

mixin VerticalFullScreenArtboard implements StatefulWidget, Artboard {
  // TODO make all build functions not resolve to null
  /// buildBody is deprecated. Pass body content as slivers by overriding buildBodySlivers()
  @deprecated
  Widget buildBody(BuildContext context) => null;
  List<Widget> buildBodySlivers(BuildContext context) => null;
  Widget buildNavBar(BuildContext context) => null;
  Widget buildDock(BuildContext context) => null;

  bool get hideNavBarOnScroll => false;

  /// `bodyScrollController` makes VerticalFullScreenArtboard aware of body content scroll behavior. This is required to enable hideNavBarOnScroll.
  ScrollController get bodyScrollController => null;

  @override
  State<StatefulWidget> createState() => _VerticalFullScreenArtboardState();
}

mixin VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    implements State<T> {
  final _navBarContainerKey = GlobalKey();
  final _dockContainerKey = GlobalKey();

  double _fullNavBarHeight;
  double _navBarHeight;
  double _dockHeight;
  double _lastBodyScrollPosition = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => _getWidgetHeights(),
    );

    if (widget.hideNavBarOnScroll) {
      assert(
        widget.bodyScrollController != null,
        'If hideNavBarOnScroll == true, bodyScrollController cannot be null.',
      );

      widget.bodyScrollController.addListener(
        () => _updateNavBarExpandedOnScroll(),
      );
    }
  }

  void _updateNavBarExpandedOnScroll() {
    final controller = widget.bodyScrollController;
    final scrollPosition = controller.offset;
    final scrollDelta = scrollPosition - _lastBodyScrollPosition;

    double _newNavBarHeight;

    if (controller.position.extentBefore <= 0) {
      _newNavBarHeight = _fullNavBarHeight;
    } else if (controller.position.extentAfter <= 0) {
      _newNavBarHeight = 0;
    } else if (scrollDelta > 0 && _navBarHeight >= 0) {
      _newNavBarHeight = max(0, _navBarHeight - scrollDelta);
    } else if (scrollDelta < 0 && _navBarHeight < _fullNavBarHeight) {
      _newNavBarHeight = min(_navBarHeight - scrollDelta, _fullNavBarHeight);
    }

    setState(() {
      if (_newNavBarHeight != null) {
        _navBarHeight = _newNavBarHeight;
      }
      _lastBodyScrollPosition = scrollPosition;
    });
  }

  void _getWidgetHeights() {
    final navBarContext = _navBarContainerKey.currentContext;
    final dockContext = _dockContainerKey.currentContext;

    if (navBarContext == null && dockContext == null) return;

    setState(() {
      if (navBarContext != null) {
        _fullNavBarHeight = navBarContext.size.height ?? 0;
        _navBarHeight = _fullNavBarHeight;
      }
      if (dockContext != null) {
        _dockHeight = dockContext.size.height ?? 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    Widget body;

    if (widget.buildBodySlivers(context) != null) {
      final navBarSpacer = SliverToBoxAdapter(
        child: Container(
          height: _fullNavBarHeight ?? 0,
        ),
      );

      final dockSpacer = SliverToBoxAdapter(
        child: Container(
          height: _dockHeight ?? 0,
        ),
      );

      final sliverList = [
        navBarSpacer,
        ...widget.buildBodySlivers(context),
        dockSpacer,
      ];

      body = CustomScrollView(
        slivers: sliverList,
        controller:
            widget.hideNavBarOnScroll ? widget.bodyScrollController : null,
      );
    } else {
      body = widget.buildBody(context);
    }

    final navBar = widget.buildNavBar(context);
    final dock = widget.buildDock(context);

    final stackChildren = <Widget>[];

    final positionedBody = Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(child: body),
    );

    stackChildren.add(positionedBody);

    if (navBar != null) {
      stackChildren.add(
        Positioned(
          key: _navBarContainerKey,
          top: 0,
          left: 0,
          right: 0,
          height: _navBarHeight,
          child: Wrap(
            children: [navBar],
            verticalDirection: VerticalDirection.up,
          ),
        ),
      );
    }

    if (dock != null) {
      stackChildren.add(
        Positioned(
          key: _dockContainerKey,
          bottom: 0,
          left: 0,
          right: 0,
          child: dock,
        ),
      );
    }

    final stack = Stack(
      children: stackChildren,
      alignment: AlignmentDirectional.bottomCenter,
    );

    final scaffold = Scaffold(
      backgroundColor: theme.color.background.generalSecondary,
      body: SafeArea(
        top: false,
        child: stack,
      ),
    );

    return scaffold;
  }
}

class _VerticalFullScreenArtboardState<T extends VerticalFullScreenArtboard>
    extends State<T> with VerticalFullScreenArtboardState<T> {}
