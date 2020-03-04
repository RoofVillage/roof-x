import 'dart:async';

import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:keyboard_accessory/index.dart';
import 'package:semantic_theme/index.dart';

import 'panel.dart';
import 'vertical_drawer_artboard.dart';

class VerticalDrawerArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  VerticalDrawerArtboardNavigator({
    this.artboard,
  });

  @override
  State<StatefulWidget> createState() =>
      VerticalDrawerInheritedArtboardNavigator();

  static VerticalDrawerInheritedArtboardNavigator of(
    BuildContext context, {
    bool shouldRebuild = false,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _VerticalDrawerInheritedArtboardNavigator>()
        : context.findAncestorWidgetOfExactType<
            _VerticalDrawerInheritedArtboardNavigator>();

    return inheritedWidget.data;
  }
}

class VerticalDrawerInheritedArtboardNavigator
    extends State<VerticalDrawerArtboardNavigator> {
  bool showsNavButton = true;

  List<VerticalDrawerArtboardNavigatorPanel> _floatingArtboardPanels = [];

  final _pageController = PageController();

  @override
  void initState() {
    final initialPanel = _buildPanelForArtboard(this.widget.artboard);
    _floatingArtboardPanels.add(initialPanel);
    super.initState();
  }

  final _popMinDragDistanceDelta = 50;
  final _popMaxDragTimeDelta = 70;

  int _initialDragTime;
  double _initialDragDy;

  int _timeDelta;
  double _downDistanceDelta;

  get _shouldPop =>
      _timeDelta < _popMinDragDistanceDelta &&
      _downDistanceDelta > _popMaxDragTimeDelta;

  get childrenDelegate => SliverChildBuilderDelegate((
        context,
        position,
      ) {
        if (position >= _floatingArtboardPanels.length) return Container();
        return _floatingArtboardPanels[position];
      });

  @override
  Widget build(BuildContext context) {
    final pageView = PageView.custom(
      childrenDelegate: childrenDelegate,
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
    );

    final swippablePage = GestureDetector(
      onTap: (() => Navigator.pop(context)),
      onVerticalDragStart: _onVerticalDragStart,
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta < 0) return;
        _onDragDownUpdate(details);
        if (_shouldPop) Navigator.pop(context);
      },
      behavior: HitTestBehavior.opaque,
      child: pageView,
    );

    final navigator = ArtboardNavigator(
      child: swippablePage,
      goTo: _goTo,
      pop: _pop,
      onNavButtonVisibilityChange: toggleNavButtonsHidden,
    );

    final scaffold = Scaffold(
      body: KeyboardAccessory(child: navigator),
      backgroundColor: Colors.transparent,
    );

    return _VerticalDrawerInheritedArtboardNavigator(
      data: this,
      child: scaffold,
    );
  }

  void back(BuildContext context) async {
    final theme = SemanticTheme.of(context);

    await _pageController.previousPage(
      duration: theme.duration.medium,
      curve: theme.curve.exit,
    );
    setState(
      () => _floatingArtboardPanels.removeLast(),
    );
  }

  void toggleNavButtonVisibilityTo(bool shouldShow) {
    if (showsNavButton == shouldShow) return;
    setState(() => showsNavButton = shouldShow);
  }

  Future<T> _goTo<T>(
    Artboard<T> artboard, {
    @required BuildContext context,
  }) async {
    if (artboard is VerticalDrawerArtboard) {
      final panel = _buildPanelForArtboard<T>(artboard);

      setState(() => _floatingArtboardPanels.add(panel));

      final theme = SemanticTheme.of(context);
      _pageController.nextPage(
        duration: theme.duration.medium,
        curve: theme.curve.enter,
      );
    } else {
      Navigator.pop(context, artboard);
    }

    return artboard.popped;
  }

  bool _pop<T>([T result]) {
    widget.artboard.didComplete();
    return Navigator.pop(context, result);
  }

  void _onVerticalDragStart(details) {
    _initialDragTime = details.sourceTimeStamp.inMilliseconds;
    _initialDragDy = details.globalPosition.dy;
  }

  void _onDragDownUpdate(details) {
    _timeDelta = details.sourceTimeStamp.inMilliseconds - _initialDragTime;
    _downDistanceDelta = details.globalPosition.dy - _initialDragDy;
  }

  void toggleNavButtonsHidden(bool isHidden) {
    setState(
      () => toggleNavButtonVisibilityTo(!isHidden),
    );
  }

  VerticalDrawerArtboardNavigatorPanel _buildPanelForArtboard<T>(
          VerticalDrawerArtboard<T> artboard) =>
      VerticalDrawerArtboardNavigatorPanel(
        artboard: artboard,
      );
}

class _VerticalDrawerInheritedArtboardNavigator extends InheritedWidget {
  final VerticalDrawerInheritedArtboardNavigator data;

  _VerticalDrawerInheritedArtboardNavigator({
    @required this.data,
    @required Widget child,
  }) : super(
          child: child,
        );

  @override
  bool updateShouldNotify(_VerticalDrawerInheritedArtboardNavigator old) =>
      false;
}
